'use strict';

const db = require('../models');
const { sendMail } = require('./mail.service');

function escapeHtml(value) {
  return String(value ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

function formatDateBR(iso) {
  const raw = String(iso || '').slice(0, 10);
  const m = raw.match(/^(\d{4})-(\d{2})-(\d{2})$/);
  if (!m) return raw || '—';
  return `${m[3]}/${m[2]}/${m[1]}`;
}

async function findSolicitanteEmail(nomeUsuario) {
  const name = String(nomeUsuario || '').trim();
  if (!name) return null;
  const user = await db.usuario.findOne({
    where: { name },
    attributes: ['id', 'name', 'email'],
  });
  return user ? { id: user.id, name: user.name, email: user.email } : null;
}

async function loadObrasByRegistros(registros) {
  const list = [...new Set(registros.map((r) => String(r).trim()).filter(Boolean))];
  if (!list.length) return [];
  const obras = await db.obra.findAll({
    where: { registro: list },
    attributes: ['registro', 'titulo', 'autor', 'classificacao', 'exemplar', 'volume'],
  });
  const byReg = new Map(obras.map((o) => [o.registro, o.get({ plain: true })]));
  return list.map((registro) => {
    const obra = byReg.get(registro);
    return {
      registro,
      titulo: obra?.titulo || 'Obra não encontrada no catálogo',
      autor: obra?.autor || '—',
      classificacao: obra?.classificacao || '—',
      exemplar: obra?.exemplar ?? '—',
      volume: obra?.volume ?? '—',
    };
  });
}

function buildLoanEmailHtml({ emprestimo, solicitanteNome, obras }) {
  const rows = obras
    .map(
      (obra, index) => `
      <tr>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${index + 1}</td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;"><strong>${escapeHtml(obra.registro)}</strong></td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(obra.titulo)}</td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(obra.autor)}</td>
      </tr>`
    )
    .join('');

  return `<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="utf-8" /><title>Comprovante de empréstimo</title></head>
<body style="margin:0;padding:0;background:#f1f5f9;font-family:Arial,Helvetica,sans-serif;color:#0f172a;">
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#f1f5f9;padding:24px 12px;">
    <tr>
      <td align="center">
        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="max-width:640px;background:#ffffff;border-radius:16px;overflow:hidden;border:1px solid #e2e8f0;">
          <tr>
            <td style="background:#162882;color:#ffffff;padding:20px 24px;">
              <div style="font-size:13px;opacity:.85;">SiSBiB · PGE-PA</div>
              <div style="font-size:22px;font-weight:bold;margin-top:4px;">Comprovante de empréstimo</div>
            </td>
          </tr>
          <tr>
            <td style="padding:24px;">
              <p style="margin:0 0 12px;font-size:15px;">Olá, <strong>${escapeHtml(solicitanteNome)}</strong>.</p>
              <p style="margin:0 0 20px;font-size:14px;line-height:1.5;color:#334155;">
                Seu empréstimo foi registrado na Biblioteca da Procuradoria-Geral do Estado do Pará.
                Conserve o material com cuidado e devolva até a data prevista.
              </p>

              <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#f8fafc;border-radius:12px;margin-bottom:20px;">
                <tr>
                  <td style="padding:14px 16px;font-size:13px;color:#475569;">
                    <div><strong>Transação:</strong> ${escapeHtml(emprestimo.id_transacao)}</div>
                    <div style="margin-top:6px;"><strong>Atendido por:</strong> ${escapeHtml(emprestimo.nome_funcionario)}</div>
                    <div style="margin-top:6px;"><strong>Data do empréstimo:</strong> ${escapeHtml(formatDateBR(emprestimo.data_emprestimo))}</div>
                    <div style="margin-top:6px;"><strong>Data prevista de devolução:</strong> ${escapeHtml(formatDateBR(emprestimo.data_prevista))}</div>
                  </td>
                </tr>
              </table>

              <div style="font-size:14px;font-weight:bold;margin-bottom:8px;">Obras emprestadas</div>
              <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border:1px solid #e2e8f0;border-radius:12px;overflow:hidden;font-size:13px;">
                <tr style="background:#f1f5f9;text-align:left;">
                  <th style="padding:10px 12px;">#</th>
                  <th style="padding:10px 12px;">Registro</th>
                  <th style="padding:10px 12px;">Título</th>
                  <th style="padding:10px 12px;">Autor</th>
                </tr>
                ${rows}
              </table>

              <p style="margin:20px 0 0;font-size:12px;line-height:1.5;color:#64748b;">
                Esta é uma mensagem automática do SiSBiB. Em caso de dúvidas, procure a equipe da biblioteca.
              </p>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>`;
}

function buildLoanEmailText({ emprestimo, solicitanteNome, obras }) {
  const lines = obras.map(
    (obra, i) =>
      `${i + 1}. ${obra.registro} — ${obra.titulo} (${obra.autor})`
  );
  return [
    `Olá, ${solicitanteNome}.`,
    '',
    'Seu empréstimo foi registrado no SiSBiB (PGE-PA).',
    `Transação: ${emprestimo.id_transacao}`,
    `Atendido por: ${emprestimo.nome_funcionario}`,
    `Data do empréstimo: ${formatDateBR(emprestimo.data_emprestimo)}`,
    `Data prevista: ${formatDateBR(emprestimo.data_prevista)}`,
    '',
    'Obras:',
    ...lines,
  ].join('\n');
}

/**
 * Send HTML loan receipt to the solicitante (or EMAIL_OVERRIDE_TO).
 * Does not throw to the HTTP layer when mail fails — returns a result object.
 */
async function notifyLoanCreated(emprestimoPlain) {
  const solicitante = await findSolicitanteEmail(emprestimoPlain.nome_usuario);
  const to = solicitante?.email;
  if (!to && !(process.env.EMAIL_OVERRIDE_TO || '').trim()) {
    return {
      sent: false,
      reason: `E-mail do solicitante "${emprestimoPlain.nome_usuario}" não encontrado.`,
    };
  }

  const registros = [1, 2, 3, 4, 5]
    .map((n) => emprestimoPlain[`registro_obra${n}`])
    .filter(Boolean);
  const obras = await loadObrasByRegistros(registros);

  const html = buildLoanEmailHtml({
    emprestimo: emprestimoPlain,
    solicitanteNome: emprestimoPlain.nome_usuario,
    obras,
  });
  const text = buildLoanEmailText({
    emprestimo: emprestimoPlain,
    solicitanteNome: emprestimoPlain.nome_usuario,
    obras,
  });

  try {
    const result = await sendMail({
      to,
      subject: `SiSBiB — Empréstimo ${emprestimoPlain.id_transacao}`,
      html,
      text,
    });
    return { sent: true, ...result };
  } catch (err) {
    console.error('[mail] falha ao enviar comprovante de empréstimo:', err);
    return {
      sent: false,
      reason: err.message || 'Falha ao enviar e-mail.',
    };
  }
}

module.exports = {
  notifyLoanCreated,
  findSolicitanteEmail,
  formatDateBR,
};
