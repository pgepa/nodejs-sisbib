'use strict';

const db = require('../models');
const Obra = db.Obra;
const User = db.user;

const allAccess = (req, res) => {
    res.status(200).send('Consulta às obras da base');
}

const userBoard = (req, res) => {
    Obra.findAll({
        where: {
            id: id
        }
    })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message
        });
    });
}

const pageNotFound = (req, res) => {
    res.status(200).send('Página não encontrada.');
}

const allUsers = (req, res) => {  
    User.findAll({
        order: [
            ['name', 'ASC']
        ]
    }).then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message
        });
    });
}

// find a single user from the database
const findOne = (req, res) => {
    const id = req.params.id;
    User.findByPk(id)
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: `Erro ao consultar certificado com ID = ${id}`
        });
    });
};

// atualiza um usuário
const update = (req, res) => {
    const id = req.params.id;
    User.update(req.body, {
        where: { id: id },
    })
    .then((num) => {
        if (num === 1) {
            res.send({
                message: 'Usuário atualizado com sucesso.'
            });
        }
        else {
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
        where: { id: id },
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

module.exports = { allAccess, userBoard, pageNotFound,
  allUsers, findOne, update, exclude };
