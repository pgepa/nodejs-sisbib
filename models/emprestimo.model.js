'use strict';

module.exports = (sequelize, DataTypes) => {
    const Emprestimo = sequelize.define('emprestimo', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        id_transacao: {
            type: DataTypes.STRING,
            allowNull: false
        },
        nome_funcionario: {
            type: DataTypes.STRING,
            allowNull: false
        },
        nome_usuario: {
            type: DataTypes.STRING,
            allowNull: false
        },
        titulo_obra1: {
            type: DataTypes.STRING,
            allowNull: false
        },
        titulo_obra2: {
            type: DataTypes.STRING,
            allowNull: true
        },
        titulo_obra3: {
            type: DataTypes.STRING,
            allowNull: true
        },
        data_emprestimo: {
            type: DataTypes.DATEONLY,
            allowNull: false
        },
        data_prevista: {
          type: DataTypes.DATEONLY,
          allowNull: false
        },
        data_devolucao: {
            type: DataTypes.DATEONLY,
            allowNull: true
        }
    }, {
        charset: 'utf8mb4',
        collate: 'utf8mb4_unicode_520_ci'
    });
    return Emprestimo;
};
