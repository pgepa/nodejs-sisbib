#!/bin/bash
pm2 stop nodejs-sisbib
pm2 start --name nodejs-sisbib app.js
