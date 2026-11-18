'use strict';

const cron = require('node-cron');
const { sendDueRemindersForDate } = require('../services/loanMail.service');
const {
  TIMEZONE,
  todayIso,
  isWeekend,
} = require('../services/serverTime.service');

async function runDueReminderJob(label) {
  const dueDate = todayIso();
  if (isWeekend()) {
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
 * 09:00 — retry for recipients not yet marked as sent
 * 10:00 — third attempt for anyone still pending
 * Times are evaluated against the server clock in TIMEZONE (APP_TZ / EMAIL_CRON_TZ).
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

  cron.schedule(
    '0 10 * * 1-5',
    () => {
      void runDueReminderJob('10h');
    },
    { timezone: TIMEZONE }
  );

  console.log(
    `[cron] lembretes de devolução agendados às 08:00, 09:00 e 10:00, seg–sex (${TIMEZONE})`
  );
}

module.exports = {
  startDueReminderJobs,
  runDueReminderJob,
};
