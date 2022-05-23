'use strict';

const express = require('express');
const obrasRouter = express.Router();
const controller = require('../controllers/obra.controller');

obrasRouter.get('/all', controller.findAll);
obrasRouter.get('/:id', controller.findOne);
obrasRouter.get('/search/:termo', controller.findSome);

obrasRouter.post('/add', controller.create);
obrasRouter.post('/:id', controller.update);



obrasRouter.delete('/:id', controller.exclude);

module.exports = obrasRouter;
