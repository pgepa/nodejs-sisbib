'use strict';

module.exports = (sequelize, DataTypes) => {
  const LoanEmailLog = sequelize.define(
    'loan_email_log',
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      kind: {
        type: DataTypes.STRING(40),
        allowNull: false,
      },
      dedupe_key: {
        type: DataTypes.STRING(191),
        allowNull: false,
        unique: true,
      },
      emprestimo_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      recipient_email: {
        type: DataTypes.STRING(255),
        allowNull: false,
      },
      recipient_name: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      reference_date: {
        type: DataTypes.DATEONLY,
        allowNull: true,
      },
      status: {
        type: DataTypes.STRING(20),
        allowNull: false,
        defaultValue: 'sent',
      },
      error_message: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      details: {
        type: DataTypes.JSON,
        allowNull: true,
      },
    },
    {
      tableName: 'loan_email_logs',
      charset: 'utf8mb4',
      collate: 'utf8mb4_unicode_520_ci',
    }
  );
  return LoanEmailLog;
};
