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
        id_funcionario: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        id_usuario: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        id_obra: {
            type: DataTypes.INTEGER,
            allowNull: false
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
