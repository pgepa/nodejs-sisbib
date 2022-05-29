'use strict';

const express = require('express');
const router = express.Router();

// custom routes
const obraRoutes = require('./obra.routes');
const usuarioRoutes = require('./usuario.routes');
const emprestimoRoutes = require('./emprestimo.routes');

router.get('/', (req, res) => {
  res.json({ message: 'Bem-vindo(a) ao sistema SISBIB.' });
});

router.use('/api/obras', obraRoutes);
router.use('/api/usuarios', usuarioRoutes);
router.use('/api/emprestimos', emprestimoRoutes );

module.exports = router;
