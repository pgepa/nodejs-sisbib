'use strict';

module.exports = (sequelize, DataTypes) => {
  const AuditLog = sequelize.define(
    'audit_log',
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      action: {
        type: DataTypes.ENUM('CREATE', 'UPDATE', 'DELETE'),
        allowNull: false,
      },
      entity: {
        type: DataTypes.STRING(64),
        allowNull: false,
        comment: 'Tabela / entidade afetada (obra, usuario, emprestimo, …)',
      },
      entity_id: {
        type: DataTypes.STRING(64),
        allowNull: true,
      },
      actor_id: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
      actor_name: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      actor_email: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      ip_address: {
        type: DataTypes.STRING(64),
        allowNull: true,
      },
      details: {
        type: DataTypes.TEXT('long'),
        allowNull: true,
        comment: 'JSON com dados relevantes da alteração (sem senhas)',
      },
      occurred_at: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      tableName: 'audit_logs',
      charset: 'utf8mb4',
      collate: 'utf8mb4_unicode_520_ci',
      updatedAt: false,
    },
  );
  return AuditLog;
};
