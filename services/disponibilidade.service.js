'use strict';

const db = require('../models');
const Obra = db.obra;
const Emprestimo = db.emprestimo;
const { Op } = db.Sequelize;

const SLOTS = [1, 2, 3, 4, 5];

function normalizeRegistro(value) {
  return String(value ?? '').trim();
}

function collectRegistros(payload = {}) {
  return SLOTS
    .map((n) => normalizeRegistro(payload[`registro_obra${n}`]))
    .filter(Boolean);
}

/**
 * Find an open loan slot for a registro (no return date filled).
 */
async function findOpenLoan(registro, excludeEmprestimoId) {
  const or = SLOTS.map((n) => ({
    [Op.and]: [
      { [`registro_obra${n}`]: registro },
      { [`data_devolucao${n}`]: { [Op.is]: null } },
    ],
  }));

  const where = { [Op.or]: or };
  if (excludeEmprestimoId != null && excludeEmprestimoId !== '') {
    where.id = { [Op.ne]: Number(excludeEmprestimoId) };
  }

  const loan = await Emprestimo.findOne({
    where,
    order: [['id', 'DESC']],
  });
  if (!loan) return null;

  const plain = loan.get({ plain: true });
  let slot = null;
  for (const n of SLOTS) {
    if (
      normalizeRegistro(plain[`registro_obra${n}`]) === registro &&
      plain[`data_devolucao${n}`] == null
    ) {
      slot = n;
      break;
    }
  }

  return {
    id: plain.id,
    id_transacao: plain.id_transacao,
    nome_usuario: plain.nome_usuario,
    nome_funcionario: plain.nome_funcionario,
    data_emprestimo: plain.data_emprestimo,
    data_prevista: plain.data_prevista,
    slot,
  };
}

/**
 * Status of a catalog registro for lending.
 */
async function getRegistroStatus(registroRaw, options = {}) {
  const registro = normalizeRegistro(registroRaw);
  if (!registro) {
    return {
      registro: '',
      exists: false,
      disponivel: false,
      obra: null,
      emprestimo: null,
      message: 'Informe um registro.',
    };
  }

  const obraRow = await Obra.findOne({
    where: { registro },
    attributes: [
      'id',
      'registro',
      'titulo',
      'autor',
      'classificacao',
      'exemplar',
      'volume',
    ],
  });

  if (!obraRow) {
    return {
      registro,
      exists: false,
      disponivel: false,
      obra: null,
      emprestimo: null,
      message: `Registro "${registro}" não encontrado no acervo.`,
    };
  }

  const obra = obraRow.get({ plain: true });
  const emprestimo = await findOpenLoan(registro, options.excludeEmprestimoId);

  if (emprestimo) {
    return {
      registro,
      exists: true,
      disponivel: false,
      obra,
      emprestimo,
      message: `Obra emprestada para ${emprestimo.nome_usuario} (prevista ${emprestimo.data_prevista}).`,
    };
  }

  return {
    registro,
    exists: true,
    disponivel: true,
    obra,
    emprestimo: null,
    message: 'Disponível para empréstimo.',
  };
}

/**
 * Validate a list of registros for a new/updated loan.
 * Throws an Error with `.status` (400/409) when invalid.
 */
async function assertRegistrosEmprestaveis(registros, options = {}) {
  const list = [...registros].map(normalizeRegistro).filter(Boolean);
  if (list.length === 0) {
    const err = new Error('Informe ao menos o registro de uma obra.');
    err.status = 400;
    throw err;
  }

  const seen = new Set();
  for (const registro of list) {
    if (seen.has(registro)) {
      const err = new Error(`Registro "${registro}" repetido neste empréstimo.`);
      err.status = 400;
      throw err;
    }
    seen.add(registro);

    const status = await getRegistroStatus(registro, options);
    if (!status.exists) {
      const err = new Error(status.message);
      err.status = 400;
      throw err;
    }
    if (!status.disponivel) {
      const err = new Error(status.message);
      err.status = 409;
      throw err;
    }
  }

  return list;
}

module.exports = {
  SLOTS,
  normalizeRegistro,
  collectRegistros,
  findOpenLoan,
  getRegistroStatus,
  assertRegistrosEmprestaveis,
};
