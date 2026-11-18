'use strict';

const cron = require('node-cron');
const {
  sendDueRemindersForDate,
  todayIsoBelem,
} = require('../services/loanMail.service');

const TIMEZONE = process.env.EMAIL_CRON_TZ || 'America/Belem';

/** Library closed on weekends (Saturday=6, Sunday=0 in en-US short weekday). */
function isWeekendInTz(timeZone = TIMEZONE) {
  const weekday = new Intl.DateTimeFormat('en-US', {
    timeZone,
    weekday: 'short',
  }).format(new Date());
  return weekday === 'Sat' || weekday === 'Sun';
}

async function runDueReminderJob(label) {
  const dueDate = todayIsoBelem();
  if (isWeekendInTz()) {
    console.log(
      `[cron:${label}] biblioteca fechada no fim de semana — lembretes não enviados (${dueDate}).`
    );
    return {
      dueDate,
      skippedWeekend: true,
      users: 0,
      sent: 0,
      skipped: 0,
      failed: 0,
    };
  }

  console.log(`[cron:${label}] lembretes de devolução para ${dueDate}…`);
  try {
    const summary = await sendDueRemindersForDate(dueDate);
    console.log(
      `[cron:${label}] usuários=${summary.users} enviados=${summary.sent} ` +
        `pulados=${summary.skipped} falhas=${summary.failed}`
    );
    return summary;
  } catch (err) {
    console.error(`[cron:${label}] erro:`, err);
    throw err;
  }
}

/**
 * 08:00 — first attempt (Mon–Fri only)
 * 09:00 — retry only for recipients not yet marked as sent (Mon–Fri only)
 */
function startDueReminderJobs() {
  if (String(process.env.EMAIL_CRON_DISABLED || '').toLowerCase() === 'true') {
    console.log('[cron] lembretes de devolução desativados (EMAIL_CRON_DISABLED=true)');
    return;
  }

  cron.schedule(
    '0 8 * * 1-5',
    () => {
      void runDueReminderJob('08h');
    },
    { timezone: TIMEZONE }
  );

  cron.schedule(
    '0 9 * * 1-5',
    () => {
      void runDueReminderJob('09h');
    },
    { timezone: TIMEZONE }
  );

  console.log(
    `[cron] lembretes de devolução agendados às 08:00 e 09:00, seg–sex (${TIMEZONE})`
  );
}

module.exports = {
  startDueReminderJobs,
  runDueReminderJob,
};
