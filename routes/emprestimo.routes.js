'use strict';

const express = require('express');
const emprestimosRouter = express.Router();

const authJwt = require('../middleware/authJwt');
const controller = require('../controllers/emprestimo.controller');

emprestimosRouter.get('/all', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findAll);
emprestimosRouter.get('/404', controller.pageNotFound);
emprestimosRouter.get('/:id', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findOne);

emprestimosRouter.post('/add', [authJwt.verifyToken, authJwt.isAdmin],
  controller.create);
emprestimosRouter.post('/search', [authJwt.verifyToken, authJwt.isAdmin],
  controller.findSome);
emprestimosRouter.post('/update', [authJwt.verifyToken, authJwt.isAdmin],
  controller.update);

emprestimosRouter.delete('/delete', [authJwt.verifyToken, authJwt.isAdmin],
  controller.exclude);

module.exports = emprestimosRouter;
