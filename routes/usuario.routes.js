'use strict';

const express = require('express');
const usuariosRouter = express.Router();

const authJwt = require('../middleware/authJwt');
const controller = require('../controllers/usuario.controller');

usuariosRouter.get('/all', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findAll);
usuariosRouter.get('/names', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findNames);
usuariosRouter.get('/404', controller.pageNotFound);
usuariosRouter.get('/count', controller.count);
usuariosRouter.get('/:id', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findOne);

usuariosRouter.post('/search', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findSome);
usuariosRouter.post('/update', [authJwt.verifyToken, authJwt.isAdmin],
  controller.update);

usuariosRouter.delete('/delete', [authJwt.verifyToken, authJwt.isAdmin],
  controller.exclude);

module.exports = usuariosRouter;