-- =============================================================================
-- Add columns `exemplar` and `volume` to `obras`
-- Type: SMALLINT NOT NULL DEFAULT 1
-- Idempotent: safe to re-run on local and production.
--
-- Usage:
--   mysql -u USER -p DATABASE < add-obras-exemplar-volume.sql
-- =============================================================================

START TRANSACTION;

-- exemplar
SET @col_exists := (
  SELECT COUNT(*)
  FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'obras'
    AND COLUMN_NAME = 'exemplar'
);
SET @sql := IF(
  @col_exists = 0,
  'ALTER TABLE obras ADD COLUMN exemplar SMALLINT NOT NULL DEFAULT 1 AFTER edicao',
  'SELECT ''column obras.exemplar already exists'' AS info'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- volume
SET @col_exists := (
  SELECT COUNT(*)
  FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME = 'obras'
    AND COLUMN_NAME = 'volume'
);
SET @sql := IF(
  @col_exists = 0,
  'ALTER TABLE obras ADD COLUMN volume SMALLINT NOT NULL DEFAULT 1 AFTER exemplar',
  'SELECT ''column obras.volume already exists'' AS info'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

COMMIT;

-- Verification
SHOW COLUMNS FROM obras LIKE 'exemplar';
SHOW COLUMNS FROM obras LIKE 'volume';
SELECT
  COUNT(*) AS total_obras,
  SUM(exemplar = 1) AS exemplar_default,
  SUM(volume = 1) AS volume_default
FROM obras;
