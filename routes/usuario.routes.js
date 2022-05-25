'use strict';

const express = require('express');
const usuariosRouter = express.Router();
const controller = require('../controllers/usuario.controller');

usuariosRouter.get('/all', controller.findAll);
usuariosRouter.get('/:id', controller.findOne);

usuariosRouter.get('/404', controller.pageNotFound);
usuariosRouter.post('/search', controller.findSome);
usuariosRouter.post('/:id', controller.update);

// delete a single certificate with id
usuariosRouter.delete('/:id', controller.exclude);

module.exports = usuariosRouter;