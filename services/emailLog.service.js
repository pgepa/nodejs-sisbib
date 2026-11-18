'use strict';

const db = require('../models');
const LoanEmailLog = db.loan_email_log;

async function wasEmailSent(dedupeKey) {
  const row = await LoanEmailLog.findOne({
    where: { dedupe_key: dedupeKey, status: 'sent' },
    attributes: ['id'],
  });
  return Boolean(row);
}

async function recordEmailSent({
  kind,
  dedupeKey,
  emprestimoId = null,
  recipientEmail,
  recipientName = null,
  referenceDate = null,
  details = null,
}) {
  try {
    await LoanEmailLog.create({
      kind,
      dedupe_key: dedupeKey,
      emprestimo_id: emprestimoId,
      recipient_email: recipientEmail,
      recipient_name: recipientName,
      reference_date: referenceDate,
      status: 'sent',
      details,
    });
    return true;
  } catch (err) {
    // Unique constraint = another worker already recorded success
    if (err.name === 'SequelizeUniqueConstraintError') {
      return false;
    }
    throw err;
  }
}

async function recordEmailFailure({
  kind,
  dedupeKey,
  emprestimoId = null,
  recipientEmail,
  recipientName = null,
  referenceDate = null,
  errorMessage,
  details = null,
}) {
  // Failures use a distinct key so retries are still allowed for the real dedupe_key
  const failKey = `${dedupeKey}::fail::${Date.now()}`;
  await LoanEmailLog.create({
    kind,
    dedupe_key: failKey,
    emprestimo_id: emprestimoId,
    recipient_email: recipientEmail || 'unknown',
    recipient_name: recipientName,
    reference_date: referenceDate,
    status: 'failed',
    error_message: errorMessage,
    details,
  });
}

module.exports = {
  wasEmailSent,
  recordEmailSent,
  recordEmailFailure,
};
