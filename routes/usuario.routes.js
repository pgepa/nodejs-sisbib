'use strict';

const express = require('express');
const usuariosRouter = express.Router();
const controller = require('../controllers/usuario.controller');

usuariosRouter.get('/all', controller.findAll);
usuariosRouter.get('/404', controller.pageNotFound);
usuariosRouter.get('/:id', controller.findOne);

usuariosRouter.post('/add', controller.create);
usuariosRouter.post('/search', controller.findSome);
usuariosRouter.post('/:id', controller.update);

// delete a single certificate with id
usuariosRouter.delete('/:id', controller.exclude);

module.exports = usuariosRouter;