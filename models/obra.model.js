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
            type: DataTypes.STRING,
            allowNull: false
        },
        registro: {
            type: DataTypes.STRING,
            allowNull: false
        },
        periodicidade: {
            type: DataTypes.STRING,
            allowNull: false
        }
    });
    return Obra;
};
