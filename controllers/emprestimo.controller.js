'use strict';

const db = require('../models');
const Emprestimo = db.emprestimo;
const Op = db.Sequelize.Op;
const { logChangeSafe } = require('../services/audit.service');
const {
    collectRegistros,
    getRegistroStatus,
    assertRegistrosEmprestaveis,
    normalizeRegistro,
} = require('../services/disponibilidade.service');
const { notifyLoanCreated } = require('../services/loanMail.service');

const disponibilidade = async (req, res) => {
    try {
        const registro = normalizeRegistro(req.query.registro);
        const excludeEmprestimoId = req.query.excludeEmprestimoId;
        const status = await getRegistroStatus(registro, { excludeEmprestimoId });
        res.status(200).send(status);
    } catch (err) {
        res.status(500).send({
            message: err.message || 'Erro ao consultar disponibilidade.',
        });
    }
};

// Cria e salva um novo empréstimo
const create = async (req, res) => {
    if (!req.body.id_transacao) {
        return res.status(400).send({
            message: 'ID da transação não pode ser vazio.',
        });
    }

    try {
        const registros = await assertRegistrosEmprestaveis(
            collectRegistros(req.body)
        );

        const emprestimo = {
            id_transacao: req.body.id_transacao,
            nome_funcionario: req.body.nome_funcionario,
            nome_usuario: req.body.nome_usuario,
            registro_obra1: registros[0],
            registro_obra2: registros[1] || null,
            registro_obra3: registros[2] || null,
            registro_obra4: registros[3] || null,
            registro_obra5: registros[4] || null,
            data_emprestimo: req.body.data_emprestimo,
            data_prevista: req.body.data_prevista,
            data_devolucao1: req.body.data_devolucao1 || null,
            data_devolucao2: req.body.data_devolucao2 || null,
            data_devolucao3: req.body.data_devolucao3 || null,
            data_devolucao4: req.body.data_devolucao4 || null,
            data_devolucao5: req.body.data_devolucao5 || null,
        };

        const data = await Emprestimo.create(emprestimo);
        logChangeSafe({
            action: 'CREATE',
            entity: 'emprestimo',
            entityId: data.id,
            details: { after: data },
        });

        const mail = await notifyLoanCreated(data.get({ plain: true }));
        const message = mail.sent
            ? `Empréstimo registrado com sucesso. Comprovante enviado para ${mail.to}.`
            : `Empréstimo registrado com sucesso. E-mail não enviado: ${mail.reason}`;

        res.status(200).send({
            data,
            message,
            email: mail,
        });
    } catch (err) {
        res.status(err.status || 500).send({
            message: err.message || 'Erro ao registrar empréstimo.',
        });
    }
};

const pageNotFound = (req, res) => {
    res.status(404).send('Página não encontrada.');
};

// Retorna todos os emprestimos
const findAll = (req, res) => {
    console.log('emprestimo.controller findAll()');
    console.log('tentativa de acesso');
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

const count = (req, res) => {
    Emprestimo.count().then((data) => {
      res.status(200).send({data});
    })
    .catch((err) => {
      res.status(500).send({
        message: err.message || 'Erro ao consultar a quantidade de emprestimos'
      })
    });
  }

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
            { registro_obra1: { [Op.like]: `%${termo}%` } },
            { registro_obra2: { [Op.like]: `%${termo}%` } },
            { registro_obra3: { [Op.like]: `%${termo}%` } },
            { registro_obra4: { [Op.like]: `%${termo}%` } },
            { registro_obra5: { [Op.like]: `%${termo}%` } }
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
const update = async (req, res) => {
    const id = req.body.id;
    try {
        const before = await Emprestimo.findByPk(id);
        if (!before) {
            return res.status(404).send({
                message: `Empréstimo com ID=${id} não encontrado.`,
            });
        }

        // Only re-check availability when registro slots change (not on pure return).
        const nextRegs = collectRegistros(req.body);
        const prevRegs = collectRegistros(before.get({ plain: true }));
        const registrosMudaram =
            nextRegs.join('|') !== prevRegs.join('|');
        if (registrosMudaram) {
            await assertRegistrosEmprestaveis(nextRegs, {
                excludeEmprestimoId: id,
            });
        }

        const [rowsUpdated] = await Emprestimo.update(req.body, {
            where: { id: id },
        });
        if (Number(rowsUpdated) > 0) {
            const after = await Emprestimo.findByPk(id);
            logChangeSafe({
                action: 'UPDATE',
                entity: 'emprestimo',
                entityId: id,
                details: { before, after },
            });
            res.send({
                message: 'Empréstimo atualizado com sucesso.',
            });
        } else {
            res.status(400).send({
                message: 'Nenhuma alteração aplicada ao empréstimo.',
            });
        }
    } catch (err) {
        res.status(err.status || 500).send({
            message: err.message,
        });
    }
};

// Exclui um emprestimo
const exclude = async (req, res) => {
    const id = req.params.id;
    try {
        const before = await Emprestimo.findByPk(id);
        const deleted = await Emprestimo.destroy({
            where: { id: id },
        });
        if (!deleted) {
            return res.status(404).send({
                message: `Empréstimo com ID=${id} não encontrado.`,
            });
        }
        logChangeSafe({
            action: 'DELETE',
            entity: 'emprestimo',
            entityId: id,
            details: { before },
        });
        res.status(200).send({ message: 'Empréstimo excluído com sucesso.' });
    } catch (err) {
        res.status(500).send({
            message: `Não foi possível excluir o empréstimo com ID=${id}`,
        });
    }
};

module.exports = {
    create,
    pageNotFound,
    findAll,
    count,
    findOne,
    findSome,
    update,
    exclude,
    disponibilidade,
};
