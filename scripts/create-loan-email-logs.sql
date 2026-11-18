-- =============================================================================
-- Table to register loan-related emails already sent (reminders / receipts)
-- Idempotent. Safe for local and production.
--
-- Usage:
--   mysql -u USER -p DATABASE < create-loan-email-logs.sql
-- =============================================================================

START TRANSACTION;

CREATE TABLE IF NOT EXISTS loan_email_logs (
  id INT NOT NULL AUTO_INCREMENT,
  kind VARCHAR(40) NOT NULL,
  dedupe_key VARCHAR(191) NOT NULL,
  emprestimo_id INT NULL,
  recipient_email VARCHAR(255) NOT NULL,
  recipient_name VARCHAR(255) NULL,
  reference_date DATE NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'sent',
  error_message TEXT NULL,
  details JSON NULL,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_loan_email_logs_dedupe (dedupe_key),
  KEY idx_loan_email_logs_kind_date (kind, reference_date),
  KEY idx_loan_email_logs_emprestimo (emprestimo_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

COMMIT;

SHOW COLUMNS FROM loan_email_logs;
