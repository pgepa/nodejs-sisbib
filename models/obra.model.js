'use strict';

module.exports = (sequelize, DataTypes) => {
    const Obra = sequelize.define('obra', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        classificacao: {
            type: DataTypes.STRING,
            allowNull: false
        },
        tipo_documental: {
            type: DataTypes.STRING,
            allowNull: false
        },
        autor: {
            type: DataTypes.STRING,
            allowNull: false
        },
        titulo: {
            type: DataTypes.STRING,
            allowNull: false
        },
        ano: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        local_publicacao: {
            type: DataTypes.STRING,
            allowNull: false
        },
        editor: {
            type: DataTypes.STRING,
            allowNull: false
        },
        edicao: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        idioma: {
            type: DataTypes.STRING,
            allowNull: false
        },
        paginas: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        descritores: {
            type: DataTypes.TEXT,
            allowNull: false
        },
        registro: {
            type: DataTypes.STRING,
            allowNull: false
        }
    }, {
        charset: 'utf8mb4',
        collate: 'utf8mb4_unicode_520_ci'
    });
    return Obra;
};
