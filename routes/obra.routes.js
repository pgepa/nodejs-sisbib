'use strict';

const express = require('express');
const obrasRouter = express.Router();

const authJwt = require('../middleware/authJwt');
const controller = require('../controllers/obra.controller');

obrasRouter.get('/all', controller.findAll);
obrasRouter.get('/reducedall', controller.findReducedAll);
obrasRouter.get('/404', controller.pageNotFound);
obrasRouter.get('/count', controller.count);
obrasRouter.get('/:id', controller.findOne);

obrasRouter.post('/add', [authJwt.verifyToken, authJwt.isAdmin],
  controller.create);
obrasRouter.post('/search', controller.findSome);
obrasRouter.post('/update', [authJwt.verifyToken, authJwt.isAdmin],
  controller.update)

obrasRouter.delete('/delete', [authJwt.verifyToken, authJwt.isAdmin],
  controller.exclude);

module.exports = obrasRouter;
