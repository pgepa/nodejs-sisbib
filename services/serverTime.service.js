'use strict';

/**
 * Canonical library clock: Node process time interpreted in APP_TZ / EMAIL_CRON_TZ.
 * Defaults to America/Belem (UTC-3, same offset as db.config timezone).
 */
const TIMEZONE =
  process.env.APP_TZ || process.env.EMAIL_CRON_TZ || 'America/Belem';

function pad(n) {
  return String(n).padStart(2, '0');
}

/**
 * Calendar/clock parts for "now" in the configured timezone.
 * Uses the server's system clock; only the zone interpretation is fixed.
 */
function nowParts(date = new Date(), timeZone = TIMEZONE) {
  const parts = new Intl.DateTimeFormat('en-US', {
    timeZone,
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hourCycle: 'h23',
  }).formatToParts(date);

  const map = {};
  for (const p of parts) {
    if (p.type !== 'literal') map[p.type] = p.value;
  }

  return {
    year: map.year,
    month: map.month,
    day: map.day,
    hour: map.hour,
    minute: map.minute,
    second: map.second,
    timeZone,
  };
}

/** YYYY-MM-DD in library timezone. */
function todayIso(date = new Date(), timeZone = TIMEZONE) {
  const p = nowParts(date, timeZone);
  return `${p.year}-${p.month}-${p.day}`;
}

/**
 * Loan register / transaction id: YYYYMMDDHHmmss from server clock in library TZ.
 */
function makeTransactionId(date = new Date(), timeZone = TIMEZONE) {
  const p = nowParts(date, timeZone);
  return `${p.year}${p.month}${p.day}${p.hour}${p.minute}${p.second}`;
}

function getServerTimePayload(date = new Date()) {
  const p = nowParts(date);
  const today = `${p.year}-${p.month}-${p.day}`;
  return {
    timezone: TIMEZONE,
    today,
    now: `${today}T${p.hour}:${p.minute}:${p.second}`,
    id_transacao: makeTransactionId(date),
    epochMs: date.getTime(),
  };
}

/** Saturday / Sunday in library timezone (en-US short weekday). */
function isWeekend(date = new Date(), timeZone = TIMEZONE) {
  const weekday = new Intl.DateTimeFormat('en-US', {
    timeZone,
    weekday: 'short',
  }).format(date);
  return weekday === 'Sat' || weekday === 'Sun';
}

module.exports = {
  TIMEZONE,
  nowParts,
  todayIso,
  makeTransactionId,
  getServerTimePayload,
  isWeekend,
  pad,
};
