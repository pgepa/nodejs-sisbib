'use strict';

const { runWithContext, setRequestMeta, setActor } = require('../services/auditContext');
const db = require('../models');
const Usuario = db.usuario;

/**
 * Abre AsyncLocalStorage para cada request (ator + IP + rota).
 * Deve ficar cedo na cadeia Express, antes das rotas.
 */
function auditRequestContext(req, res, next) {
  const ip =
    (req.headers['x-forwarded-for'] &&
      String(req.headers['x-forwarded-for']).split(',')[0].trim()) ||
    req.socket?.remoteAddress ||
    req.ip ||
    null;

  runWithContext({}, () => {
    setRequestMeta({
      ip,
      method: req.method,
      path: req.originalUrl || req.url,
    });
    next();
  });
}

/**
 * Após verifyToken: carrega usuário e grava ator no contexto ALS + req.user.
 */
async function attachAuditActor(req, res, next) {
  try {
    if (!req.userId) return next();
    const user = await Usuario.findByPk(req.userId, {
      attributes: ['id', 'name', 'email', 'inscription'],
    });
    if (user) {
      const actor = {
        id: user.id,
        name: user.name,
        email: user.email,
        inscription: user.inscription,
      };
      req.user = actor;
      setActor(actor);
    }
  } catch (err) {
    console.error('[audit] não foi possível carregar ator:', err.message);
  }
  next();
}

module.exports = {
  auditRequestContext,
  attachAuditActor,
};
