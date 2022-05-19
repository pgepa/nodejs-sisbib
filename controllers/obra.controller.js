'use strict';

const db = require('../models');
const Certificate = db.certificate;
const Op = db.Sequelize.Op;

// Criar e salvar uma nova obra
const create = (req, res) => {
    // Validate request
    if (!req.body.title) {
        res.status(400).send({
            message: 'Conteúdo não pode ser vazio.'
        });
        return;
    }

    // Create a certificate
    const obra = {
        classificacao: req.body.classificacao,
        tipo_documental: req.body.tipo_documental,
        autor: req.body.autor,
        titulo: req.body.titulo,
        ano: req.body.ano,
        local_publicacao: req.body.local_publicacao,
        editor: req.body.editor,
        edicao: req.body.edicao,
        idioma: req.body.idioma,
        paginas: req.body.paginas,
        descritores: req.body.descritores,
        registro: req.body.registro,
        periodicidade: req.body.periodicidade
    };

    // Salva a obra na base
    Obra.create(obra)
        .then((data) => {
            res.status(200).send({
                data: data,
                message: 'Obra cadastrada com sucesso.'
            });
        })
        .catch((err) => {
            res.status(500).send({
                message: err.message || 'Erro ao inserir obra.'
            });
        });
};


// Encontra todas as obras da base
const findAll = (req, res) => {
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    Obra.findAll({ limit, offset }).then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar obra.'
        });
    });
};


// Consulta uma unica obra na base
const findOne = (req, res) => {
    const id = req.params.id;
    Obra.findByPk(id)
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: 'Erro ao consultar obra com ID=' + id
        });
    });
};

// Retrieve some certificates from the database according to restriction
const findSome = (req, res) => {
    const id = req.body.id;
    const condition = id ? { id: { [Op.like]: `%${id}%` } } : null;
    Certificate.findAll({ where: condition })
    .then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar obra.'
        });
    });
};

// Atualiza uma obra pelo id na requisicao
const update = (req, res) => {
    const id = req.params.id;
    obra.update(req.body, {
        where: { id: id },
    })
    .then((num) => {
        if (num == 1) {
            res.send({
                message: 'obra atualizado com sucesso..'
            });
        } else {
            res.send({
                message: `Não foi possível atualizar a obra com ID = ${id}`
            });
        }
    })
    .catch((err) => {
        res.status(500).send({
            message: `Erro ao atualizar a obra com ID = ${id}`
        });
    });
};

// Deleta uma obra com o id especificado pela requisicao
const exclude = (req, res) => {
    const id = req.params.id;
    Obra.destroy({
        where: { id: id },
    })
    .then(() => {
        res.status(200).send('obra excluída com sucesso.');
    })
    .catch((err) => {
        res.status(500).send({
            message: `Não foi possível excluir a obra com ID = ${id}`
        });
    });
};

module.exports = { create, findAll, findOne, findSome, update, exclude };
