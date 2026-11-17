'use strict';

const nodemailer = require('nodemailer');

function envFlag(name, fallback = false) {
  const raw = process.env[name];
  if (raw == null || raw === '') return fallback;
  return ['1', 'true', 'yes', 'on'].includes(String(raw).toLowerCase());
}

/**
 * Port 587 normally uses STARTTLS (secure: false).
 * Port 465 uses implicit TLS (secure: true).
 * EMAIL_SECURE is respected when it matches the port; otherwise we pick the
 * conventional setting for the port and log a note.
 */
function buildTransportOptions() {
  const host = process.env.EMAIL_HOST;
  const port = Number(process.env.EMAIL_PORT || 587);
  const user = process.env.EMAIL_AUTH_USER;
  const pass = process.env.EMAIL_AUTH_PASSWORD;
  const authType = String(process.env.EMAIL_AUTH_TYPE || 'TLS').toUpperCase();
  const wantSecure = envFlag('EMAIL_SECURE', port === 465);

  let secure = wantSecure;
  if (port === 587 && wantSecure) {
    // Common misconfiguration: 587 + secure:true often fails handshake.
    secure = false;
    console.warn(
      '[mail] EMAIL_PORT=587 with EMAIL_SECURE=true → using STARTTLS (secure:false).'
    );
  }
  if (port === 465 && !wantSecure) {
    secure = true;
  }

  const options = {
    host,
    port,
    secure,
    auth: user ? { user, pass } : undefined,
  };

  if (authType === 'TLS' || port === 587) {
    options.requireTLS = true;
  }

  // Internal corporate relays sometimes use private CAs.
  if (envFlag('EMAIL_TLS_REJECT_UNAUTHORIZED', true) === false) {
    options.tls = { rejectUnauthorized: false };
  }

  return options;
}

let transporter;

function getTransporter() {
  if (!transporter) {
    if (!process.env.EMAIL_HOST) {
      throw new Error('EMAIL_HOST não configurado no .env');
    }
    transporter = nodemailer.createTransport(buildTransportOptions());
  }
  return transporter;
}

function getFromAddress() {
  return (
    process.env.EMAIL_FROM ||
    process.env.EMAIL_AUTH_USER ||
    'notificacoes@pge.pa.gov.br'
  );
}

/**
 * Resolve the destination address.
 * EMAIL_OVERRIDE_TO (if set) forces the recipient — useful while testing.
 */
function resolveRecipient(preferredEmail) {
  const override = (process.env.EMAIL_OVERRIDE_TO || '').trim();
  if (override) return override;
  return (preferredEmail || '').trim();
}

async function sendMail({ to, subject, html, text }) {
  const recipient = resolveRecipient(to);
  if (!recipient) {
    throw new Error('Destinatário de e-mail não informado.');
  }

  const info = await getTransporter().sendMail({
    from: `"SiSBiB | PGE-PA" <${getFromAddress()}>`,
    to: recipient,
    subject,
    text,
    html,
  });

  return {
    messageId: info.messageId,
    accepted: info.accepted,
    to: recipient,
  };
}

async function verifyMailTransport() {
  return getTransporter().verify();
}

module.exports = {
  sendMail,
  verifyMailTransport,
  getFromAddress,
  resolveRecipient,
};
