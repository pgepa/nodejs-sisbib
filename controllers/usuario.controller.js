'use strict';

const db = require('../models');
const Usuario = db.usuario;
const Op = db.Sequelize.Op;

// Criar e salvar um novo usuario
const create = (req, res) => {
    // Validate request
    if (!req.body.title) {
        res.status(400).send({
            message: 'Conteúdo não pode ser vazio.'
        });
        return;
    }

    // Create a user
    const usuario = {
        inscription: req.body.inscription,
        name: req.body.name,
        department: req.body.department,
        cpf: req.body.cpf,
        workload: req.body.workload,
        password: req.body.password
    };

    // Salva o usuario na base
    Usuario.create(usuario)
        .then((data) => {
            res.status(200).send({
                data: data,
                message: 'Usuário cadastrada com sucesso.'
            });
        })
        .catch((err) => {
            res.status(500).send({
                message: err.message || 'Erro ao inserir usuário.'
            });
        });
};

const allAccess = (req, res) => {
    res.status(200).send(
        '<h1 class="container" style="font-family:Arial;">Página Inicial do Usuário Visitante</h1>'
    );
};

const pageNotFound = (req, res) => {
    res.status(200).send('Página não encontrada.');
};

const findAll = (req, res) => {
    Usuario.findAll({
        order: [
            ['name', 'ASC']
        ]
    })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message
        });
    });
};

// find a single user from the database
const findOne = (req, res) => {
    const id = req.params.id;
    Usuario.findByPk(id)
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: `Erro ao consultar usuário com ID = ${id}`
        });
    });
};

// atualiza um usuário
const update = (req, res) => {
    const id = req.params.id;
    User.update(req.body, {
        where: { id: id }
    })
    .then((num) => {
        if (num === 1) {
            res.send({
                message: 'Usuário atualizado com sucesso.'
            });
        } else {
            res.send({
                message: `Não foi possível atualizar o usuário ID = ${id}`
            });
        }
    })
    .catch((err) => {
        res.status(500).send({
            message: `Erro ao atualizar o usuário ID = ${id}`
        });
    });
};

// exclui um usuário
const exclude = (req, res) => {
    const id = req.params.id;
    User.destroy({
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

module.exports = { create, allAccess, pageNotFound, findAll, findOne, update,
    exclude };
