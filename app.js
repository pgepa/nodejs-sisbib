'use strict';

const express = require('express');
const app = express();

const db = require('./models');
const dotenv = require('dotenv');
const path = require('path');

const routes = require('./routes');

global.__basedir = __dirname;
db.sequelize.sync();

const publicFolder = path.join(__dirname,'public');
app.use(express.static(publicFolder));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(routes);

dotenv.config();

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor em execução na porta ${PORT}`);
});
