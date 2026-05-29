'use strict';

const db = require('../models');
const Usuario = db.usuario;
const Op = db.Sequelize.Op;
const bcrypt = require('bcryptjs');

// Cria e salva um novo usuario
const create = (req, res) => {
    // Valida requisicao
    if (!req.body.inscription) {
        res.status(400).send({
            message: 'Conteúdo não pode ser vazio.'
        });
        return;
    }

    // Cria um usuario
    const usuario = {
        inscription: req.body.inscription,
        name: req.body.name,
        department: req.body.department,
        email: req.body.email,
        cpf: req.body.cpf,
        password: bcrypt.hashSync(req.body.password, 8)
    };

    // Salva o usuario na base
    Usuario.create(usuario)
        .then((data) => {
            res.status(200).send({
                data: data,
                message: 'Usuário cadastrado com sucesso.'
            });
        })
        .catch((err) => {
            res.status(500).send({
                message: err.message || 'Erro ao inserir usuário.'
            });
        });
};

const pageNotFound = (req, res) => {
    res.status(404).send('Página não encontrada.');
};

// Retorna todos os usuarios
const findAll = (req, res) => {
    console.log('usuario.controller findAll()');
    console.log('tentativa de acesso');
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    Usuario.findAll({
        limit: limit,
        offset: offset,
        order: [
            ['name', 'ASC']
        ]
    })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar usuário.'
        });
    });
};

const count = (req, res) => {
    Usuario.count().then((data) => {
      res.status(200).send({data});
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || 'Erro ao consultar a quantidade de usuarios'
      })
    });
  }

// Encontra um unico usuario na base
const findOne = (req, res) => {
    const id = req.params.id;
    Usuario.findByPk(id, {
        attributes: { exclude: ['password'] }
    })
    .then((data) => {
        if (!data) {
            return res.status(404).send({ message: 'Usuário não encontrado.' });
        }
        return data.getRoles().then((roles) => {
            const plain = data.get({ plain: true });
            res.status(200).send({
                ...plain,
                roles: roles.map((r) => r.name)
            });
        });
    })
    .catch((err) => {
        res.status(500).send({
            message: `Erro ao consultar usuário com ID = ${id}`
        });
    });
};

// Encontra alguns usuarios de acordo com o termo de busca
const findSome = (req, res) => {
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    const termo = req.body.termo;
    const condition = termo ? {
        [Op.or] : [
            { inscription: { [Op.like]: `%${termo}%` } },
            { name: { [Op.like]: `%${termo}%` } },
            { department: { [Op.like]: `%${termo}%` } },
            { cpf: { [Op.like]: `%${termo}%` }}
        ]
    } : null;
    Usuario.findAll({ limit, offset, where: condition })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar usuário.'
        });
    });
};

const findNames = (req, res) => {
  const limit = parseInt(req.query.limit) || 20
  const page = parseInt(req.query.page) || 1
  const offset = (page - 1) * limit;
  Usuario.findAll({
      attributes: ['id', 'name'],
      limit: limit,
      offset: offset,
      order: [
          ['name', 'ASC']
      ]
  })
  .then((data) => {
      res.status(200).send(data);
  })
  .catch((err) => {
      res.status(500).send({
          message: err.message || 'Erro ao consultar usuário.'
      });
  });
};

// Atualiza um usuario (dados, senha opcional, perfis / roles)
const update = async (req, res) => {
    const id = req.body.id;
    if (!id) {
        return res.status(400).send({ message: 'ID do usuário é obrigatório.' });
    }
    try {
        const user = await Usuario.findByPk(id);
        if (!user) {
            return res.status(404).send({ message: 'Usuário não encontrado.' });
        }

        const { roles, password, confirmPassword, ...raw } = req.body;
        const allowed = ['inscription', 'name', 'department', 'cpf', 'email', 'phone'];
        const updates = {};
        for (const key of allowed) {
            if (raw[key] !== undefined && raw[key] !== null) {
                updates[key] = raw[key];
            }
        }

        if (password !== undefined && password !== null && String(password).trim() !== '') {
            updates.password = bcrypt.hashSync(String(password).trim(), 8);
        }

        if (Object.keys(updates).length > 0) {
            await user.update(updates);
        }

        if (roles !== undefined && roles !== null) {
            if (!Array.isArray(roles) || roles.length === 0) {
                return res.status(400).send({
                    message: 'Informe ao menos um perfil (user ou admin).'
                });
            }
            for (let i = 0; i < roles.length; i++) {
                if (!db.ROLES.includes(roles[i])) {
                    return res.status(400).send({
                        message: `Perfil inválido: ${roles[i]}`
                    });
                }
            }
            const Role = db.role;
            const roleRows = await Role.findAll({
                where: { name: { [Op.in]: roles } }
            });
            await user.setRoles(roleRows);
        }

        return res.status(200).send({
            message: 'Usuário atualizado com sucesso.'
        });
    } catch (err) {
        return res.status(500).send({
            message: err.message || 'Erro ao atualizar usuário.'
        });
    }
};

// Exclui um usuário
const exclude = (req, res) => {
    const id = req.params.id;
    Usuario.destroy({
        where: { id: id }
    })
    .then(() => {
        res.status(200).send('Usuário excluído com sucesso.');
    })
    .catch((err) => {
        res.status(500).send({
            message: `Não foi possível excluir o usuário com ID=${id}`
        });
    });
};

module.exports = { create, pageNotFound, findAll, count,
    findOne, findSome, findNames, update, exclude };
