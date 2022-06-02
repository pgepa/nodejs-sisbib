'use strict';

const express = require('express');
const authRoutes = express.Router();

const verifySignUp = require('../middleware/verifySignUp');
const authController = require('../controllers/auth.controller');

authRoutes.post('/changenewpass', authController.changeNewPass);
authRoutes.post('/changepass', authController.changePass);
authRoutes.post('/signin', authController.signIn);
authRoutes.post('/signup',
  [verifySignUp.checkDuplicates, verifySignUp.checkRoles],
  authController.signUp
);

module.exports = authRoutes;
