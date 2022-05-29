'use strict';

const express = require('express');
const emprestimosRouter = express.Router();
const controller = require('../controllers/emprestimo.controller');

emprestimosRouter.get('/all', controller.findAll);
emprestimosRouter.get('/404', controller.pageNotFound);
emprestimosRouter.get('/:id', controller.findOne);

emprestimosRouter.post('/add', controller.create);
emprestimosRouter.post('/search', controller.findSome);
emprestimosRouter.post('/update', controller.update);

emprestimosRouter.delete('/delete', controller.exclude);

module.exports = emprestimosRouter;