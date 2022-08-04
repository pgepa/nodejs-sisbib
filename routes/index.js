'use strict';

const express = require('express');
const router = express.Router();

// custom routes
const authRoutes = require('./auth.routes');
const emprestimoRoutes = require('./emprestimo.routes');
const obraRoutes = require('./obra.routes');
const usuarioRoutes = require('./usuario.routes');

router.get('/', (req, res) => {
  res.json({ message: 'Bem-vindo(a) ao sistema SiSBiB.' });
});

router.use('/api/auth', authRoutes);
router.use('/api/emprestimos', emprestimoRoutes );
router.use('/api/obras', obraRoutes);
router.use('/api/usuarios', usuarioRoutes);

module.exports = router;
