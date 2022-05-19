'use strict';

const express = require('express');
const usersRouter = express.Router();
const controller = require('../controllers/user.controller');

usersRouter.get('/all', controller.allAccess);
usersRouter.get('/404', controller.pageNotFound);
usersRouter.get('/:id', controller.findOne);
usersRouter.post('/:id', controller.update);

// delete a single certificate with id
usersRouter.delete('/:id', controller.exclude);

module.exports = usersRouter;