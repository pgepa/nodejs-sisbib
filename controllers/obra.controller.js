'use strict';

const db = require('../models');
const Obra = db.obra;
const Op = db.Sequelize.Op;

// Cria e salvar uma nova obra
const create = (req, res) => {
    // Valida requisicao
    if (!req.body.titulo) {
        res.status(400).send({
            message: 'Conteúdo não pode ser vazio.'
        });
        return;
    }

    // Propriedades do objeto obra
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
        registro: req.body.registro
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

// Retorna todas as obras
const findAll = (req, res) => {
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    Obra.findAll({
        limit: limit,
        offset: offset,
        order: [
            [ 'id', 'DESC' ]
        ]
    }).then((data) => {
        res.status(200).send(data);
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar obra.'
        });
    });
};

const count = (req, res) => {
  Obra.count().then((data) => {
    res.status(200).send({data});
  })
  .catch((err) => {
    res.status(500).send({
      message: err.message || 'Erro ao consultar a quantidade de obras'
    })
  });
}

// Retorna todas as obras
const findReducedAll = (req, res) => {
    const limit = parseInt(req.query.limit) || 20
    const page = parseInt(req.query.page) || 1
    const offset = (page - 1) * limit;
    Obra.findAll({
        attributes: ['id', 'classificacao', 'autor', 'titulo', 'descritores', 'registro'],
        limit: limit,
        offset: offset,
        order: [
            [ 'id', 'DESC' ]
        ]
    }).then((data) => {
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

// Consulta algumas obras de acordo com a condicao
const findSome = (req, res) => {
    const limit = parseInt(req.query.limit) || 20;
    const page = parseInt(req.query.page) || 1;
    const offset = (page - 1) * limit;
    const termo = req.body.termo ? req.body.termo.trim() : '';
    const filtro = req.body.filtro || 'todos';

    let condition = null;
    if (termo) {
        const words = termo.split(/\s+/).filter(Boolean);
        const andConditions = words.map((word) => {
            let orList = [];
            if (filtro === 'titulo') {
                orList.push({ titulo: { [Op.like]: `%${word}%` } });
            } else if (filtro === 'autor') {
                orList.push({ autor: { [Op.like]: `%${word}%` } });
            } else if (filtro === 'registro') {
                orList.push({ registro: { [Op.like]: `%${word}%` } });
            } else if (filtro === 'classificacao') {
                orList.push({ classificacao: { [Op.like]: `%${word}%` } });
            } else if (filtro === 'descritores') {
                orList.push({ descritores: { [Op.like]: `%${word}%` } });
            } else if (filtro === 'editor') {
                orList.push({ editor: { [Op.like]: `%${word}%` } });
            } else if (filtro === 'ano') {
                if (!isNaN(word) && Number.isInteger(Number(word))) {
                    orList.push({ ano: parseInt(word, 10) });
                }
            } else {
                // 'todos' (padrao)
                orList = [
                    { classificacao: { [Op.like]: `%${word}%` } },
                    { autor: { [Op.like]: `%${word}%` } },
                    { titulo: { [Op.like]: `%${word}%` } },
                    { descritores: { [Op.like]: `%${word}%` } },
                    { registro: { [Op.like]: `%${word}%` } },
                    { editor: { [Op.like]: `%${word}%` } },
                    { local_publicacao: { [Op.like]: `%${word}%` } }
                ];
                if (!isNaN(word) && Number.isInteger(Number(word))) {
                    orList.push({ ano: parseInt(word, 10) });
                }
            }
            return { [Op.or]: orList };
        });
        condition = { [Op.and]: andConditions };
    }

    Obra.findAndCountAll({
        limit,
        offset,
        where: condition,
        order: [
            [ 'id', 'DESC' ]
        ]
    })
    .then((result) => {
        res.set('x-total-count', result.count);
        res.status(200).send({
            data: result.rows,
            totalItems: result.count,
            totalPages: Math.ceil(result.count / limit),
            currentPage: page
        });
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao consultar obra.'
        });
    });
};

const pageNotFound = (req, res) => {
  res.status(404).send('Página não encontrada.');
};

// Atualiza uma obra de acordo com o id da requisicao
const update = (req, res) => {
    const id = req.body.id;
    Obra.update(req.body, {
        where: { id: id },
    })
    .then((rowsUpdated) => {
      if (Number(rowsUpdated) > 0) {
        res.send({
          message: 'Obra atualizada com sucesso.'
        });
      }
      else {
        res.send({
          message: 'Erro ao atualizar obra.'
        });
      }
    })
    .catch((err) => {
        res.status(500).send({
            message: err.message || 'Erro ao atualizar obra.'
        });
    });
};

// Exclui uma obra de acordo com o id da requisicao
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

module.exports = { create, findAll, count, findReducedAll, findOne,
    findSome, pageNotFound, update, exclude };
