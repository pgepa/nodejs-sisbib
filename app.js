'use strict';

const dotenv = require('dotenv');
dotenv.config();

const express = require('express');
const app = express();
const cors = require('cors');

const db = require('./models');
const path = require('path');

const routes = require('./routes');

global.__basedir = __dirname;
db.sequelize.sync();

const corsOrigins = [
  'http://localhost:4000',
  'http://127.0.0.1:4000',
];
if (process.env.URL) {
  corsOrigins.push(`http://${process.env.URL}:4000`);
}
app.use(cors({
  origin: corsOrigins,
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
  preflightContinue: false
}));

const publicFolder = path.join(__dirname,'public');
app.use(express.static(publicFolder));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(routes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor em execução na porta ${PORT}`);
});
