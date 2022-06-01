'use strict';

const db = require('../models');
const Emprestimo = db.emprestimo;
const Op = db.Sequelize.Op;

// Cria e salva um novo usuario
const create = (req, res) => {
    // Valida requisicao
    if (!req.body.id_transacao) {
        res.status(400).send({
            message: 'ID da transação não pode ser vazio.'
        });
        return;
    }

    // Cria um  emprestimo
    const emprestimo = {
        id_transacao: req.body.id_transacao,
        nome_funcionario: req.body.nome_funcionario,
        nome_usuario: req.body.nome_usuario,
        titulo_obra1: req.body.titulo_obra1,
        titulo_obra2: req.body.titulo_obra2,
        titulo_obra3: req.body.titulo_obra3,
        data_emprestimo: req.body.data_emprestimo,
        data_prevista: req.body.data_prevista,
        data_devolucao: req.body.data_devolucao
    };

    // Salva o emprestimo na base
    Emprestimo.create(emprestimo)
        .then((data) => {
            res.status(200).send({
                data: data,
                message: 'Empréstimo registrado com sucesso.'
            });
        })
        .catch((err) => {
            res.status(500).send({
                message: err.message || 'Erro ao registrar empréstimo.'
            });
        });
};

const pageNotFound = (req, res) => {
    res.status(404).send('Página não encontrada.');
};

// Retorna todos os emprestimos
const findAll = (req, res) => {
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    Emprestimo.findAll({
        limit: limit,
        offset: offset,
        order: [
            ['id_transacao', 'ASC']
        ]
    })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar empréstimo.'
        });
    });
};

// Encontra um unico emprestimo
const findOne = (req, res) => {
    const id = req.params.id;
    Emprestimo.findByPk(id)
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: `Erro ao consultar empréstimo com ID = ${id}`
        });
    });
};

// Encontra alguns emprestimos de acordo com o termo de busca
const findSome = (req, res) => {
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    const termo = req.body.termo;
    const condition = termo ? {
        [Op.or] : [
            { nome_funcionario: { [Op.like]: `%${termo}%` } },
            { nome_usuario: { [Op.like]: `%${termo}%` } },
            { titulo_obra1: { [Op.like]: `%${termo}%` } },
            { titulo_obra2: { [Op.like]: `%${termo}%` } },
            { titulo_obra3: { [Op.like]: `%${termo}%` } }
        ]
    } : null;
    Emprestimo.findAll({ limit, offset, where: condition })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar emprestimo.'
        });
    });
};

// Atualiza um emprestimo
const update = (req, res) => {
    const id = req.body.id;
    Emprestimo.update(req.body, {
        where: { id: id }
    })
    .then((rowsUpdated) => {
      if (Number(rowsUpdated) > 0) {
        res.send({
          message: 'Empréstimo atualizado com sucesso.'
        });
      }
      else {
        res.send({
          message: 'Erro ao atualizar empréstimo.'
        });
      }
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao atualizar empréstimo.'
        });
    });
};

// Exclui um emprestimo
const exclude = (req, res) => {
    const id = req.params.id;
    Emprestimo.destroy({
        where: { id: id }
    })
    .then(() => {
        res.status(200).send('Empréstimo excluído com sucesso.');
    })
    .catch((err) => {
        res.status(500).send({
            message: `Não foi possível excluir o empréstimo com ID=${id}`
        });
    });
};

module.exports = { create, pageNotFound, findAll, findOne, findSome,
  update, exclude };
