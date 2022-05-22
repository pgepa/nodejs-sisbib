'use strict';

const config = require('../config/db.config');
const obraModel = require('../models/obra.model');
const usuarioModel = require('./usuario.model');

const { Sequelize, DataTypes } = require('sequelize');
const sequelize = new Sequelize(
    config.DB,
    config.USER,
    config.PASSWORD,
    {
        define: {
            charset: 'utf8mb4',
            collate: 'utf8mb4_unicode_520_ci',
            timestamps: true
        },
        host: config.HOST,
        dialect: config.dialect,
        logging: console.log,
        operatorAliases: false,
        pool: {
            max: config.pool.max,
            min: config.pool.min,
            acquire: config.pool.acquire,
            idle: config.pool.idle
        },
        timezone: config.timezone
    }
);

const db = Object.create(null);

db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.DataTypes = DataTypes;

db.user = userModel(sequelize, DataTypes);
db.obra = obraModel(sequelize, DataTypes);

module.exports = db;
