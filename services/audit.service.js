'use strict';

const fs = require('fs');
const path = require('path');
const { getContext } = require('./auditContext');

const LOG_DIR = path.join(__dirname, '..', 'logs', 'audit');

const SENSITIVE_KEYS = new Set([
  'password',
  'confirmPassword',
  'oldPassword',
  'newPassword',
  'repeatPassword',
  'accessToken',
  'token',
]);

function ensureLogDir() {
  if (!fs.existsSync(LOG_DIR)) {
    fs.mkdirSync(LOG_DIR, { recursive: true });
  }
}

function sanitize(value) {
  if (value == null) return value;
  if (Array.isArray(value)) return value.map(sanitize);
  if (typeof value !== 'object') return value;
  if (value instanceof Date) return value.toISOString();
  // Sequelize model instance
  if (typeof value.toJSON === 'function') {
    return sanitize(value.toJSON());
  }
  const out = {};
  for (const [key, val] of Object.entries(value)) {
    if (SENSITIVE_KEYS.has(key)) {
      out[key] = '[REDACTED]';
    } else {
      out[key] = sanitize(val);
    }
  }
  return out;
}

function filePathFor(date = new Date()) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return path.join(LOG_DIR, `audit-${y}-${m}-${d}.log`);
}

function appendFileLog(entry) {
  try {
    ensureLogDir();
    fs.appendFileSync(filePathFor(new Date(entry.occurred_at)), `${JSON.stringify(entry)}\n`, 'utf8');
  } catch (err) {
    console.error('[audit] falha ao gravar arquivo de log:', err.message);
  }
}

/**
 * Registra uma alteração (CREATE | UPDATE | DELETE) no banco e em arquivo.
 * Nunca lança — falhas de auditoria não devem quebrar a operação principal.
 */
async function logChange({
  action,
  entity,
  entityId = null,
  details = null,
  actor = null,
  ip = null,
}) {
  const ctx = getContext();
  const occurredAt = new Date();
  const resolvedActor = actor || ctx.actor || {};
  const entry = {
    action: String(action).toUpperCase(),
    entity: String(entity),
    entity_id: entityId != null ? String(entityId) : null,
    actor_id: resolvedActor.id ?? resolvedActor.actor_id ?? null,
    actor_name: resolvedActor.name ?? resolvedActor.actor_name ?? null,
    actor_email: resolvedActor.email ?? resolvedActor.actor_email ?? null,
    ip_address: ip || ctx.ip || null,
    details: details != null ? JSON.stringify(sanitize(details)) : null,
    occurred_at: occurredAt.toISOString(),
    request_path: ctx.path || null,
    request_method: ctx.method || null,
  };

  // Arquivo primeiro: sobrevive a exclusão do banco.
  appendFileLog(entry);

  try {
    const db = require('../models');
    if (!db.audit_log) return entry;
    await db.audit_log.create({
      action: entry.action,
      entity: entry.entity,
      entity_id: entry.entity_id,
      actor_id: entry.actor_id,
      actor_name: entry.actor_name,
      actor_email: entry.actor_email,
      ip_address: entry.ip_address,
      details: entry.details,
      occurred_at: occurredAt,
    });
  } catch (err) {
    console.error('[audit] falha ao gravar log no banco:', err.message);
  }

  return entry;
}

function logChangeSafe(payload) {
  Promise.resolve()
    .then(() => logChange(payload))
    .catch((err) => {
      console.error('[audit] erro inesperado:', err.message);
    });
}

module.exports = {
  logChange,
  logChangeSafe,
  sanitize,
  LOG_DIR,
};
