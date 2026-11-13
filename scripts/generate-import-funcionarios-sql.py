#!/usr/bin/env python3
"""
Generate an idempotent SQL script to import funcionarios from
2026-10-funcionarios.xlsx into the `usuarios` table.

Rules:
- Match existing users by CPF (digits only, 11 chars). Keep them unchanged.
- Deduplicate spreadsheet rows by CPF (same person, multiple vínculos):
  prefer vínculo "1", then lowest vínculo number.
- New users get:
    email  = firstname.lastname@pge.pa.gov.br  (ASCII, no accents)
    phone  = 987654321
    password hash for plain text "123456" (bcrypt cost 8, same as the app)
    department = majority-mapped code from Lotação (see LOTACAO_TO_DEPT)
- Also assigns ROLE user (roleId = 1) when missing.
- Safe to re-run: inserts only when CPF is not already present.

Usage:
  python3 generate-import-funcionarios-sql.py \\
      [--xlsx /path/to/2026-10-funcionarios.xlsx] \\
      [--db-dump /path/to/usuarios.tsv] \\
      [--out import-funcionarios-2026-10.sql]

If --db-dump is omitted, CPFs/emails are read from MySQL `esap.usuarios`
using credentials from ../.env (HOST, DB_NAME, DB_USER, DB_PASSWORD).
"""

from __future__ import annotations

import argparse
import os
import re
import subprocess
import unicodedata
from collections import Counter, defaultdict
from datetime import datetime, timezone
from pathlib import Path

try:
    import openpyxl
except ImportError as exc:  # pragma: no cover
    raise SystemExit("openpyxl is required: pip install openpyxl") from exc

ROOT = Path(__file__).resolve().parents[2]
DEFAULT_XLSX = ROOT / "2026-10-funcionarios.xlsx"
DEFAULT_OUT = Path(__file__).resolve().parent / "import-funcionarios-2026-10.sql"

# bcryptjs.hashSync('123456', 8) — shared temporary password for new accounts
PASSWORD_HASH = "$2a$08$aMKzYGO1K65UDeWv.G3MD..JMkAThwwASB9xoaEJ8EPlHXh44Yrly"
DEFAULT_PHONE = "987654321"
EMAIL_DOMAIN = "pge.pa.gov.br"

PARTICLES = {
    "de",
    "da",
    "do",
    "dos",
    "das",
    "e",
    "di",
    "del",
    "della",
    "van",
    "von",
}

# Majority Lotação → department code, derived from current DB matches.
LOTACAO_TO_DEPT = {
    "SECRETARIA CIVEL TRABALHISTA E ADMINISTRATIVA": "SECPCTA",
    "PROCURADORIA CIVEL TRABALHISTA E ADMINISTRATIVA": "PCTA",
    "GABINETE DO PROCURADOR GERAL": "GAB",
    "PROCURADORIA DA DIVIDA ATIVA": "PDA",
    "CENTRO DE ESTUDOS": "ESAP",
    "SECRETARIA DA PROCURADORIA DA DIVIDA ATIVA": "SECPDA",
    "GERENCIA DE TRANPORTE E COMUNICAÇÕES": "GTRAN",
    "GERENCIA DE TRANPORTE E COMUNICACOES": "GTRAN",
    "SECRETARIA DA PROCURADORIA DE EXECUÇÕES": "SECPRPV",
    "SECRETARIA DA PROCURADORIA DE EXECUCOES": "SECPRPV",
    "SECRETARIA DA PROCURADORIA CONSULTIVA": "SECPCON",
    "GERENCIA DE INFORMÁTICA": "DTI",
    "GERENCIA DE INFORMATICA": "DTI",
    "PROCURADORIA ASSES JUR A CHEFIA DO PODER EXECUTIVO": "PCON",
    "1ª REGIONAL": "P1AR",
    "1A REGIONAL": "P1AR",
    "GERENCIA DE RECURSOS HUMANOS": "GRH",
    "PROCURADORIA CONSULTIVA": "PCON",
    "GERENCIA DE SERVIÇOS": "GSERV",
    "GERENCIA DE SERVICOS": "GSERV",
    "GERENCIA DE EXECUCAO ORCAMENTARIA E FINANCEIRA": "GEOF",
    "PROCURADORIA FISCAL": "PROFISCO",
    "PROCURADORIA AMBIENTAL E MINERARIA": "PFAM",
    "SECRETARIA DA PROCURADORIA SETORIAL DE BRASILIA": "SECPBSB",
    "GERENCIA DE MATERIAL": "GMAP",
    "SECRETARIA DA PROCURADORIA DE ASSESSOR DE GOVERNO": "SECPGOV",
    "3ª REGIONAL": "P3AR",
    "3A REGIONAL": "P3AR",
    "GERENCIA CONTABIL": "GCONT",
    "SECRETARIA DA PROCURADORIA FISCAL": "SECPROFISCO",
    "PROCURADORIA SETORIAL DE BRASILIA": "PBSB",
    "NUCLEO DE CONTROLE INTERNO": "CI",
    "SECRETARIA DA PROCURADORIA AMBIENTAL E MINERARIA": "SECPFAM",
    "PROCURADORIA DE EXECUÇÕES": "PRPV",
    "PROCURADORIA DE EXECUCOES": "PRPV",
    "SECRETARIA DA COORDENADORIA FINANCEIRA": "SECCOFIN",
    "GERENCIA DE LICITAÇÕES E CONTRATOS": "GLIC",
    "GERENCIA DE LICITACOES E CONTRATOS": "GLIC",
    "SECRETARIA DA DIRETORIA ADMINISTRATIVA E FINANÇAS": "SECDAF",
    "SECRETARIA DA DIRETORIA ADMINISTRATIVA E FINANCAS": "SECDAF",
    "SECRETARIA DA PROCURADORIA FUNDIARIA E IMOBILIARIA": "SECPFAM",
    "4ª REGIONAL": "P4AR",
    "4A REGIONAL": "P4AR",
    "PROCURADOR GERAL DO ESTADO": "GAB",
    "PROCURADOR GERAL ADJUNTO ADMINISTRATIVO": "PCON",
    "DIRETORIA ADMINISTRATIVA E FINANÇAS": "DAF",
    "DIRETORIA ADMINISTRATIVA E FINANCAS": "DAF",
    "NUCLEO DE PLANEJAMENTO": "NUPLAN",
    "COORDENADORIA FINANCEIRA": "COFIN",
    "PROCURADOR GERAL ADJUNTO DO CONTENCIOSO": "PCTA",
    "COORDENADORIA ADMINISTRATIVA": "COAD",
    "CONSELHO SUPERIOR": "GAB",
}


def strip_accents(text: str) -> str:
    nfkd = unicodedata.normalize("NFKD", text)
    return "".join(c for c in nfkd if not unicodedata.combining(c))


def normalize_cpf(value) -> str:
    digits = re.sub(r"\D", "", str(value or ""))
    return digits.zfill(11) if digits else ""


def sql_str(value: str) -> str:
    return "'" + value.replace("\\", "\\\\").replace("'", "''") + "'"


def load_env(env_path: Path) -> dict[str, str]:
    data: dict[str, str] = {}
    if not env_path.exists():
        return data
    for line in env_path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, val = line.split("=", 1)
        data[key.strip()] = val.strip().strip('"').strip("'")
    return data


def load_db_users_from_mysql(env: dict[str, str]) -> tuple[set[str], set[str]]:
    host = env.get("HOST", "localhost")
    db = env.get("DB_NAME", "esap")
    user = env.get("DB_USER", "root")
    password = env.get("DB_PASSWORD", "")
    cmd = [
        "mysql",
        "-u",
        user,
        "-h",
        host,
        "-N",
        "-B",
        "-e",
        "SELECT cpf, email FROM usuarios;",
        db,
    ]
    proc = subprocess.run(
        cmd,
        env={**os.environ, "MYSQL_PWD": password},
        capture_output=True,
        text=True,
        check=True,
    )
    cpfs: set[str] = set()
    emails: set[str] = set()
    for line in proc.stdout.splitlines():
        if not line.strip():
            continue
        cpf, email = line.split("\t")
        cpfs.add(normalize_cpf(cpf))
        emails.add(email.strip().lower())
    return cpfs, emails


def load_db_users_from_tsv(path: Path) -> tuple[set[str], set[str]]:
    cpfs: set[str] = set()
    emails: set[str] = set()
    for line in path.read_text(encoding="utf-8").splitlines():
        parts = line.split("\t")
        if len(parts) < 2:
            continue
        # accept either "cpf\temail" or full dump "cpf\tinscription\tname\tdept\temail"
        if len(parts) >= 5:
            cpf, email = parts[0], parts[4]
        else:
            cpf, email = parts[0], parts[1]
        cpfs.add(normalize_cpf(cpf))
        emails.add(email.strip().lower())
    return cpfs, emails


def read_sheet(xlsx: Path) -> list[dict]:
    wb = openpyxl.load_workbook(xlsx, data_only=True)
    ws = wb["Funcionários"] if "Funcionários" in wb.sheetnames else wb.active
    headers = [c.value for c in next(ws.iter_rows(min_row=1, max_row=1))]
    idx = {h: i for i, h in enumerate(headers)}
    required = ["Matrícula", "Nome", "CPF", "Lotação", "Vínculo"]
    for col in required:
        if col not in idx:
            raise SystemExit(f"Missing column {col!r} in spreadsheet")

    rows: list[dict] = []
    for row in ws.iter_rows(min_row=2, values_only=True):
        if not row[idx["Matrícula"]]:
            continue
        rows.append(
            {
                "inscription": str(row[idx["Matrícula"]]).strip(),
                "vinculo": str(row[idx["Vínculo"]]).strip()
                if row[idx["Vínculo"]] is not None
                else "",
                "name": " ".join(str(row[idx["Nome"]]).split()),
                "cpf": normalize_cpf(row[idx["CPF"]]),
                "lotacao": str(row[idx["Lotação"]] or "").strip(),
            }
        )
    return rows


def dedupe_by_cpf(rows: list[dict]) -> list[dict]:
    by_cpf: dict[str, list[dict]] = defaultdict(list)
    for r in rows:
        if r["cpf"]:
            by_cpf[r["cpf"]].append(r)

    def sort_key(r: dict):
        v = r["vinculo"]
        try:
            vnum = int(v)
        except ValueError:
            vnum = 99
        return (v != "1", vnum, r["inscription"])

    return [sorted(group, key=sort_key)[0] for group in by_cpf.values()]


def name_tokens(full_name: str) -> list[str]:
    ascii_name = strip_accents(full_name).upper()
    raw = re.findall(r"[A-Z]+", ascii_name)
    return [t for t in raw if t.lower() not in PARTICLES]


def base_email_local(full_name: str) -> str:
    tokens = name_tokens(full_name)
    if not tokens:
        return "usuario"
    first = tokens[0].lower()
    last = tokens[-1].lower() if len(tokens) > 1 else "user"
    return f"{first}.{last}"


def allocate_email(full_name: str, used: set[str]) -> str:
    tokens = name_tokens(full_name)
    first = tokens[0].lower() if tokens else "usuario"
    last = tokens[-1].lower() if len(tokens) > 1 else "user"
    candidates = [f"{first}.{last}"]
    # middle initial variants: first.m.last
    for mid in tokens[1:-1]:
        candidates.append(f"{first}.{mid[0].lower()}{last}")
    # first + second surname style
    if len(tokens) >= 3:
        candidates.append(f"{first}.{tokens[-2].lower()}")
    n = 2
    while True:
        for local in candidates:
            email = f"{local}@{EMAIL_DOMAIN}".lower()
            if email not in used:
                used.add(email)
                return email
        candidates = [f"{first}.{last}{n}"]
        n += 1


def map_department(lotacao: str) -> str:
    key = " ".join(lotacao.split())
    if key in LOTACAO_TO_DEPT:
        return LOTACAO_TO_DEPT[key]
    # accent-insensitive fallback
    plain = strip_accents(key).upper()
    for k, v in LOTACAO_TO_DEPT.items():
        if strip_accents(k).upper() == plain:
            return v
    # last resort: truncated lotação label (keeps data usable)
    return (key[:40] or "INDEFINIDO")


def generate_sql(
    new_users: list[dict],
    stats: dict,
    out: Path,
) -> None:
    now = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S")
    lines: list[str] = []
    lines.append("-- =============================================================================")
    lines.append("-- Import funcionários → usuarios (idempotent)")
    lines.append(f"-- Source : 2026-10-funcionarios.xlsx")
    lines.append(f"-- Generated at: {now} UTC")
    lines.append("--")
    lines.append(f"-- Spreadsheet rows        : {stats['sheet_rows']}")
    lines.append(f"-- Unique CPF in sheet     : {stats['unique_cpf']}")
    lines.append(f"-- Already in database     : {stats['existing']}")
    lines.append(f"-- New users to insert     : {stats['new']}")
    lines.append(f"-- Duplicate sheet rows    : {stats['dup_rows']} (same CPF, extra vínculo)")
    lines.append("--")
    lines.append("-- Defaults for NEW users:")
    lines.append(f"--   phone    = {DEFAULT_PHONE}")
    lines.append(f"--   email    = firstname.lastname@{EMAIL_DOMAIN}")
    lines.append("--   password = 123456  (bcrypt cost 8; change after first login)")
    lines.append("--   role     = user (roleId = 1)")
    lines.append("-- Existing users are NOT updated.")
    lines.append("-- Safe to re-run on production: guarded by CPF / user_roles checks.")
    lines.append("-- =============================================================================")
    lines.append("")
    lines.append("START TRANSACTION;")
    lines.append("")

    for u in new_users:
        cpf = u["cpf"]
        lines.append(f"-- {u['name']} | mat={u['inscription']} | cpf={cpf}")
        lines.append("INSERT INTO usuarios (")
        lines.append(
            "  inscription, name, department, cpf, email, phone, password, createdAt, updatedAt"
        )
        lines.append(")")
        lines.append("SELECT")
        lines.append(
            f"  {sql_str(u['inscription'])}, {sql_str(u['name'])}, {sql_str(u['department'])},"
        )
        lines.append(
            f"  {sql_str(cpf)}, {sql_str(u['email'])}, {sql_str(DEFAULT_PHONE)},"
        )
        lines.append(f"  {sql_str(PASSWORD_HASH)}, NOW(), NOW()")
        lines.append("FROM DUAL")
        lines.append(f"WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE cpf = {sql_str(cpf)});")
        lines.append("")
        lines.append("INSERT INTO user_roles (userId, roleId, createdAt, updatedAt)")
        lines.append("SELECT u.id, 1, NOW(), NOW()")
        lines.append("FROM usuarios u")
        lines.append(f"WHERE u.cpf = {sql_str(cpf)}")
        lines.append(
            "  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.userId = u.id AND ur.roleId = 1);"
        )
        lines.append("")

    lines.append("COMMIT;")
    lines.append("")
    lines.append("-- Verification helpers:")
    lines.append("-- SELECT COUNT(*) FROM usuarios;")
    lines.append(
        f"-- SELECT inscription, name, department, cpf, email, phone FROM usuarios WHERE phone = '{DEFAULT_PHONE}' ORDER BY id DESC LIMIT 20;"
    )

    out.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--xlsx", type=Path, default=DEFAULT_XLSX)
    parser.add_argument("--db-dump", type=Path, default=None)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    args = parser.parse_args()

    if not args.xlsx.exists():
        raise SystemExit(f"Spreadsheet not found: {args.xlsx}")

    sheet_rows = read_sheet(args.xlsx)
    unique = dedupe_by_cpf(sheet_rows)
    dup_rows = len(sheet_rows) - len(unique)

    env = load_env(Path(__file__).resolve().parents[1] / ".env")
    if args.db_dump:
        existing_cpfs, used_emails = load_db_users_from_tsv(args.db_dump)
    else:
        existing_cpfs, used_emails = load_db_users_from_mysql(env)

    new_users: list[dict] = []
    for r in sorted(unique, key=lambda x: (x["name"], x["cpf"])):
        if r["cpf"] in existing_cpfs:
            continue
        email = allocate_email(r["name"], used_emails)
        new_users.append(
            {
                **r,
                "email": email,
                "department": map_department(r["lotacao"]),
            }
        )

    stats = {
        "sheet_rows": len(sheet_rows),
        "unique_cpf": len(unique),
        "existing": len(unique) - len(new_users),
        "new": len(new_users),
        "dup_rows": dup_rows,
    }
    generate_sql(new_users, stats, args.out)

    dept_counts = Counter(u["department"] for u in new_users)
    print(f"Wrote {args.out}")
    print(
        f"sheet={stats['sheet_rows']} unique_cpf={stats['unique_cpf']} "
        f"existing={stats['existing']} new={stats['new']} dup_rows={stats['dup_rows']}"
    )
    print("departments for new users:")
    for d, c in dept_counts.most_common():
        print(f"  {c:3d}  {d}")
    print("sample emails:")
    for u in new_users[:8]:
        print(f"  {u['email']:40s}  {u['name']}")


if __name__ == "__main__":
    main()
