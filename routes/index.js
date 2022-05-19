'use strict';

const express = require('express');
const router = express.Router();

// custom routes
const obraRoutes = require('./obra.routes');
const userRoutes = require('./user.routes');

router.get('/', (req, res) => {
  res.json({ message: 'Bem-vindo(a) ao sistema SISBIB.' });
});

router.use('/api/obras', obraRoutes);
router.use('/api/users', userRoutes);

module.exports = router;
