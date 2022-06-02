'use strict';

const bcrypt = require('bcryptjs');
const config = require('../config/auth.config');
const db = require('../models');
const jwt = require('jsonwebtoken');

const Usuario = db.usuario;
const Role = db.role;
const Op = db.Sequelize.Op;

const signUp = (req, res) => {
  // salva usuario na base
  Usuario.create({
    inscription: req.body.inscription,
    name: req.body.name,
    department: req.body.department,
    cpf: req.body.cpf,
    email: req.body.email,
    password: bcrypt.hashSync(req.body.password, 8)
  })
    .then((user) => {
      if (req.body.roles) {
        Role.findAll({
          where: {
            name: {
              [Op.or]: req.body.roles
            }
          }
        })
          .then((roles) => {
            user.setRoles(roles).then(() => {
              res.send({ message: 'Usuário cadastrado com sucesso.' });
            });
          });
      }
      else {
        user.setRoles([1]).then(() => {
          res.send({ message: 'Usuário cadastrado com sucesso.' });
        });
      }
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
}

const signIn = (req, res) => {
  console.log('Tentativa de acesso:');
  console.log(`req.body.email = ${String(req.body.email)}`);
  console.log(`req.body.password = ${req.body.password}`);
  Usuario.findOne({
    where: {
      email: req.body.email
    }
  })
    .then((user) => {
      if (!user) {
        return res.status(404).send({ message: 'Usuário não encontrado.' });
      }
      const isValidPassword = bcrypt.compareSync(
        req.body.password,
        user.password
      );
      if (!isValidPassword) {
        return res.status(401).send({
          accessToken: null,
          message: 'Senha inválida.'
        });
      }
      const token = jwt.sign({ id: user.id }, config.secret, {
        expiresIn: 300 // 5 mins
      });
      const authorities = [];
      user.getRoles().then((roles) => {
        for (let i = 0; i < roles.length; i++) {
          authorities.push(`ROLE_${roles[i].name.toUpperCase()}`);
        }
        res.status(200).send({
          id: user.id,
          inscription: user.inscription,
          name: user.name,
          department: user.department,
          cpf: user.cpf,
          email: user.email,
          roles: authorities,
          accessToken: token,
          message: 'Usuário(a) autenticado(a) com sucesso.'
        });
      });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
}

const changePass = (req, res) => {
  Usuario.findOne({
    where: {
      email: req.body.email
    }
  })
    .then((user) => {
      if (!user) {
        return res.status(404).send({ message: 'Usuário não encontrado.' });
      }
      const isValidPassword = bcrypt.compareSync(
        req.body.oldPassword,
        user.password
      );
      if (!isValidPassword) {
        return res.status(401).send({
          accessToken: null,
          message: 'Senha antiga inválida.'
        });
      }
      const newEqualRepeat = req.body.newPassword === req.body.repeatPassword;
      if (!newEqualRepeat) {
        return res.status(401).send({
          accessToken: null,
          message: 'A senha repetida não coincide com a nova senha.'
        });
      }
      user.update({
        password: bcrypt.hashSync(req.body.newPassword, 8)
      });
      return res.status(200).send({
        message: 'Senha alterada com sucesso.'
      });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
}

const changeNewPass = (req, res) => {
  Usuario.findOne({
    where: {
      email: req.body.email
    }
  })
    .then((user) => {
      if (!user) {
        return res.status(404).send({ message: 'Usuário não encontrado.' });
      }
      user.update({
        password: bcrypt.hashSync(req.body.newPassword, 8)
      });
      return res.status(200).send({
        message: 'Senha alterada com sucesso.'
      });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
}

module.exports = { signUp, signIn, changePass, changeNewPass };
