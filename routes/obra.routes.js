'use strict';

const express = require('express');
const obrasRouter = express.Router();
const controller = require('../controllers/obra.controller');

obrasRouter.get('/all', controller.findAll);
obrasRouter.get('/404', controller.pageNotFound);
obrasRouter.get('/:id', controller.findOne);

obrasRouter.post('/add', controller.create);
obrasRouter.post('/search', controller.findSome);
obrasRouter.post('/update', controller.update)

obrasRouter.delete('/delete', controller.exclude);

module.exports = obrasRouter;
