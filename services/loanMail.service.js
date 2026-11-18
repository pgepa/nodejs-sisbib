'use strict';

const db = require('../models');
const { sendMail, resolveRecipient } = require('./mail.service');
const {
  wasEmailSent,
  recordEmailSent,
  recordEmailFailure,
} = require('./emailLog.service');

const SLOTS = [1, 2, 3, 4, 5];

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

function todayIsoBelem() {
  return new Intl.DateTimeFormat('en-CA', {
    timeZone: 'America/Belem',
  }).format(new Date());
}

function openSlots(emprestimo) {
  const open = [];
  for (const n of SLOTS) {
    const registro = String(emprestimo[`registro_obra${n}`] ?? '').trim();
    if (!registro) continue;
    const devolucao = emprestimo[`data_devolucao${n}`];
    if (devolucao == null || String(devolucao).trim() === '') {
      open.push({ slot: n, registro });
    }
  }
  return open;
}

function newlyReturnedSlots(before, after) {
  const returned = [];
  for (const n of SLOTS) {
    const registro = String(after[`registro_obra${n}`] ?? '').trim();
    if (!registro) continue;
    const prev = before[`data_devolucao${n}`];
    const next = after[`data_devolucao${n}`];
    const wasEmpty = prev == null || String(prev).trim() === '';
    const nowFilled = next != null && String(next).trim() !== '';
    if (wasEmpty && nowFilled) {
      returned.push({
        slot: n,
        registro,
        data_devolucao: String(next).slice(0, 10),
      });
    }
  }
  return returned;
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

function obrasTableRows(obras, extraCell) {
  return obras
    .map((obra, index) => {
      const extra = extraCell
        ? `<td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(extraCell(obra))}</td>`
        : '';
      return `
      <tr>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${index + 1}</td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;"><strong>${escapeHtml(obra.registro)}</strong></td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(obra.titulo)}</td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(obra.autor)}</td>
        ${extra}
      </tr>`;
    })
    .join('');
}

function wrapEmail({ title, introHtml, metaHtml, tableTitle, tableHead, tableBody }) {
  return `<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="utf-8" /><title>${escapeHtml(title)}</title></head>
<body style="margin:0;padding:0;background:#f1f5f9;font-family:Arial,Helvetica,sans-serif;color:#0f172a;">
  <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#f1f5f9;padding:24px 12px;">
    <tr>
      <td align="center">
        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="max-width:640px;background:#ffffff;border-radius:16px;overflow:hidden;border:1px solid #e2e8f0;">
          <tr>
            <td style="background:#162882;color:#ffffff;padding:20px 24px;">
              <div style="font-size:13px;opacity:.85;">SiSBiB · PGE-PA</div>
              <div style="font-size:22px;font-weight:bold;margin-top:4px;">${escapeHtml(title)}</div>
            </td>
          </tr>
          <tr>
            <td style="padding:24px;">
              ${introHtml}
              ${metaHtml || ''}
              <div style="font-size:14px;font-weight:bold;margin:0 0 8px;">${escapeHtml(tableTitle)}</div>
              <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border:1px solid #e2e8f0;border-radius:12px;overflow:hidden;font-size:13px;">
                <tr style="background:#f1f5f9;text-align:left;">${tableHead}</tr>
                ${tableBody}
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

function buildLoanEmailHtml({ emprestimo, solicitanteNome, obras }) {
  return wrapEmail({
    title: 'Comprovante de empréstimo',
    introHtml: `
      <p style="margin:0 0 12px;font-size:15px;">Olá, <strong>${escapeHtml(solicitanteNome)}</strong>.</p>
      <p style="margin:0 0 20px;font-size:14px;line-height:1.5;color:#334155;">
        Seu empréstimo foi registrado na Biblioteca da Procuradoria-Geral do Estado do Pará.
        Conserve o material com cuidado e devolva até a data prevista.
      </p>`,
    metaHtml: `
      <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#f8fafc;border-radius:12px;margin-bottom:20px;">
        <tr>
          <td style="padding:14px 16px;font-size:13px;color:#475569;">
            <div><strong>Transação:</strong> ${escapeHtml(emprestimo.id_transacao)}</div>
            <div style="margin-top:6px;"><strong>Atendido por:</strong> ${escapeHtml(emprestimo.nome_funcionario)}</div>
            <div style="margin-top:6px;"><strong>Data do empréstimo:</strong> ${escapeHtml(formatDateBR(emprestimo.data_emprestimo))}</div>
            <div style="margin-top:6px;"><strong>Data prevista de devolução:</strong> ${escapeHtml(formatDateBR(emprestimo.data_prevista))}</div>
          </td>
        </tr>
      </table>`,
    tableTitle: 'Obras emprestadas',
    tableHead: `
      <th style="padding:10px 12px;">#</th>
      <th style="padding:10px 12px;">Registro</th>
      <th style="padding:10px 12px;">Título</th>
      <th style="padding:10px 12px;">Autor</th>`,
    tableBody: obrasTableRows(obras),
  });
}

function buildLoanEmailText({ emprestimo, solicitanteNome, obras }) {
  const lines = obras.map(
    (obra, i) => `${i + 1}. ${obra.registro} — ${obra.titulo} (${obra.autor})`
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

function buildDueReminderHtml({ solicitanteNome, dueDate, items }) {
  const rows = items
    .map((item, index) => `
      <tr>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${index + 1}</td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(item.id_transacao)}</td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;"><strong>${escapeHtml(item.registro)}</strong></td>
        <td style="padding:10px 12px;border-bottom:1px solid #e2e8f0;">${escapeHtml(item.titulo)}</td>
      </tr>`)
    .join('');

  return wrapEmail({
    title: 'Lembrete de devolução',
    introHtml: `
      <p style="margin:0 0 12px;font-size:15px;">Olá, <strong>${escapeHtml(solicitanteNome)}</strong>.</p>
      <p style="margin:0 0 20px;font-size:14px;line-height:1.5;color:#334155;">
        Este é um lembrete: há obra(s) com devolução prevista para
        <strong>${escapeHtml(formatDateBR(dueDate))}</strong>.
        Por favor, devolva o material hoje na biblioteca da PGE-PA.
      </p>`,
    metaHtml: '',
    tableTitle: 'Obras a devolver hoje',
    tableHead: `
      <th style="padding:10px 12px;">#</th>
      <th style="padding:10px 12px;">Transação</th>
      <th style="padding:10px 12px;">Registro</th>
      <th style="padding:10px 12px;">Título</th>`,
    tableBody: rows,
  });
}

function buildDueReminderText({ solicitanteNome, dueDate, items }) {
  const lines = items.map(
    (item, i) =>
      `${i + 1}. [${item.id_transacao}] ${item.registro} — ${item.titulo}`
  );
  return [
    `Olá, ${solicitanteNome}.`,
    '',
    `Lembrete: há obra(s) com devolução prevista para ${formatDateBR(dueDate)}.`,
    'Por favor, devolva o material hoje na biblioteca da PGE-PA.',
    '',
    ...lines,
  ].join('\n');
}

function buildReturnReceiptHtml({ emprestimo, solicitanteNome, obras, dataDevolucao }) {
  return wrapEmail({
    title: 'Comprovante de devolução',
    introHtml: `
      <p style="margin:0 0 12px;font-size:15px;">Olá, <strong>${escapeHtml(solicitanteNome)}</strong>.</p>
      <p style="margin:0 0 20px;font-size:14px;line-height:1.5;color:#334155;">
        Registramos a devolução do(s) material(is) abaixo. Obrigado por devolver
        dentro do prazo.
      </p>`,
    metaHtml: `
      <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#f8fafc;border-radius:12px;margin-bottom:20px;">
        <tr>
          <td style="padding:14px 16px;font-size:13px;color:#475569;">
            <div><strong>Transação:</strong> ${escapeHtml(emprestimo.id_transacao)}</div>
            <div style="margin-top:6px;"><strong>Data prevista:</strong> ${escapeHtml(formatDateBR(emprestimo.data_prevista))}</div>
            <div style="margin-top:6px;"><strong>Data da devolução:</strong> ${escapeHtml(formatDateBR(dataDevolucao))}</div>
          </td>
        </tr>
      </table>`,
    tableTitle: 'Obras devolvidas',
    tableHead: `
      <th style="padding:10px 12px;">#</th>
      <th style="padding:10px 12px;">Registro</th>
      <th style="padding:10px 12px;">Título</th>
      <th style="padding:10px 12px;">Autor</th>`,
    tableBody: obrasTableRows(obras),
  });
}

function buildReturnReceiptText({ emprestimo, solicitanteNome, obras, dataDevolucao }) {
  const lines = obras.map(
    (obra, i) => `${i + 1}. ${obra.registro} — ${obra.titulo} (${obra.autor})`
  );
  return [
    `Olá, ${solicitanteNome}.`,
    '',
    'Registramos a devolução do(s) material(is) abaixo.',
    `Transação: ${emprestimo.id_transacao}`,
    `Data prevista: ${formatDateBR(emprestimo.data_prevista)}`,
    `Data da devolução: ${formatDateBR(dataDevolucao)}`,
    '',
    'Obras devolvidas:',
    ...lines,
  ].join('\n');
}

async function sendTrackedMail({
  kind,
  dedupeKey,
  emprestimoId,
  to,
  recipientName,
  referenceDate,
  subject,
  html,
  text,
  details,
}) {
  if (await wasEmailSent(dedupeKey)) {
    return { sent: false, skipped: true, reason: 'E-mail já enviado anteriormente.' };
  }

  const preferred = to;
  if (!preferred && !(process.env.EMAIL_OVERRIDE_TO || '').trim()) {
    return {
      sent: false,
      reason: `E-mail do destinatário não encontrado.`,
    };
  }

  try {
    const result = await sendMail({ to: preferred, subject, html, text });
    await recordEmailSent({
      kind,
      dedupeKey,
      emprestimoId,
      recipientEmail: result.to,
      recipientName,
      referenceDate,
      details,
    });
    return { sent: true, ...result };
  } catch (err) {
    console.error(`[mail] falha (${kind}):`, err);
    try {
      await recordEmailFailure({
        kind,
        dedupeKey,
        emprestimoId,
        recipientEmail: resolveRecipient(preferred) || preferred || 'unknown',
        recipientName,
        referenceDate,
        errorMessage: err.message || String(err),
        details,
      });
    } catch (logErr) {
      console.error('[mail] falha ao registrar erro de e-mail:', logErr);
    }
    return { sent: false, reason: err.message || 'Falha ao enviar e-mail.' };
  }
}

async function notifyLoanCreated(emprestimoPlain) {
  const solicitante = await findSolicitanteEmail(emprestimoPlain.nome_usuario);
  const registros = SLOTS.map((n) => emprestimoPlain[`registro_obra${n}`]).filter(Boolean);
  const obras = await loadObrasByRegistros(registros);
  const dedupeKey = `loan_created:${emprestimoPlain.id}`;

  return sendTrackedMail({
    kind: 'loan_created',
    dedupeKey,
    emprestimoId: emprestimoPlain.id,
    to: solicitante?.email,
    recipientName: emprestimoPlain.nome_usuario,
    referenceDate: emprestimoPlain.data_emprestimo,
    subject: `SiSBiB — Empréstimo ${emprestimoPlain.id_transacao}`,
    html: buildLoanEmailHtml({
      emprestimo: emprestimoPlain,
      solicitanteNome: emprestimoPlain.nome_usuario,
      obras,
    }),
    text: buildLoanEmailText({
      emprestimo: emprestimoPlain,
      solicitanteNome: emprestimoPlain.nome_usuario,
      obras,
    }),
    details: { registros },
  });
}

/**
 * Reminder for users with at least one book due today (still not returned).
 * Groups by solicitante; skips recipients already marked as sent for the day.
 */
async function sendDueRemindersForDate(dueDate = todayIsoBelem()) {
  const loans = await db.emprestimo.findAll({
    where: { data_prevista: dueDate },
  });

  const byUser = new Map();
  for (const loan of loans) {
    const plain = loan.get({ plain: true });
    const open = openSlots(plain);
    if (!open.length) continue;
    const key = plain.nome_usuario;
    if (!byUser.has(key)) byUser.set(key, []);
    byUser.get(key).push({ plain, open });
  }

  const summary = { dueDate, users: 0, sent: 0, skipped: 0, failed: 0, details: [] };

  for (const [nomeUsuario, entries] of byUser.entries()) {
    summary.users += 1;
    const solicitante = await findSolicitanteEmail(nomeUsuario);
    const emailKey = (solicitante?.email || nomeUsuario).trim().toLowerCase();
    const dedupeKey = `due_reminder:${emailKey}:${dueDate}`;

    if (await wasEmailSent(dedupeKey)) {
      summary.skipped += 1;
      summary.details.push({ nomeUsuario, status: 'skipped' });
      continue;
    }

    const registros = entries.flatMap((e) => e.open.map((o) => o.registro));
    const obras = await loadObrasByRegistros(registros);
    const obraByReg = new Map(obras.map((o) => [o.registro, o]));
    const items = entries.flatMap(({ plain, open }) =>
      open.map((o) => ({
        id_transacao: plain.id_transacao,
        emprestimo_id: plain.id,
        registro: o.registro,
        titulo: obraByReg.get(o.registro)?.titulo || '—',
      }))
    );

    const result = await sendTrackedMail({
      kind: 'due_reminder',
      dedupeKey,
      emprestimoId: entries[0].plain.id,
      to: solicitante?.email,
      recipientName: nomeUsuario,
      referenceDate: dueDate,
      subject: `SiSBiB — Lembrete de devolução (${formatDateBR(dueDate)})`,
      html: buildDueReminderHtml({
        solicitanteNome: nomeUsuario,
        dueDate,
        items,
      }),
      text: buildDueReminderText({
        solicitanteNome: nomeUsuario,
        dueDate,
        items,
      }),
      details: { items },
    });

    if (result.sent) summary.sent += 1;
    else if (result.skipped) summary.skipped += 1;
    else summary.failed += 1;
    summary.details.push({ nomeUsuario, ...result });
  }

  return summary;
}

/**
 * Return receipt when books are returned on/before the due date (data_prevista).
 */
async function notifyReturnReceipt(beforePlain, afterPlain) {
  const returned = newlyReturnedSlots(beforePlain, afterPlain);
  if (!returned.length) {
    return { sent: false, skipped: true, reason: 'Nenhuma devolução nova.' };
  }

  const due = String(afterPlain.data_prevista || '').slice(0, 10);
  const onOrBeforeDue = returned.filter((r) => r.data_devolucao <= due);
  if (!onOrBeforeDue.length) {
    return {
      sent: false,
      skipped: true,
      reason: 'Devolução após a data prevista — recibo automático não enviado.',
    };
  }

  const slotsKey = onOrBeforeDue.map((r) => `${r.slot}:${r.data_devolucao}`).join(',');
  const dedupeKey = `return_receipt:${afterPlain.id}:${slotsKey}`;
  const solicitante = await findSolicitanteEmail(afterPlain.nome_usuario);
  const obras = await loadObrasByRegistros(onOrBeforeDue.map((r) => r.registro));
  const dataDevolucao = onOrBeforeDue[0].data_devolucao;

  return sendTrackedMail({
    kind: 'return_receipt',
    dedupeKey,
    emprestimoId: afterPlain.id,
    to: solicitante?.email,
    recipientName: afterPlain.nome_usuario,
    referenceDate: dataDevolucao,
    subject: `SiSBiB — Devolução ${afterPlain.id_transacao}`,
    html: buildReturnReceiptHtml({
      emprestimo: afterPlain,
      solicitanteNome: afterPlain.nome_usuario,
      obras,
      dataDevolucao,
    }),
    text: buildReturnReceiptText({
      emprestimo: afterPlain,
      solicitanteNome: afterPlain.nome_usuario,
      obras,
      dataDevolucao,
    }),
    details: { returned: onOrBeforeDue },
  });
}

module.exports = {
  notifyLoanCreated,
  notifyReturnReceipt,
  sendDueRemindersForDate,
  findSolicitanteEmail,
  formatDateBR,
  todayIsoBelem,
  openSlots,
  newlyReturnedSlots,
};
