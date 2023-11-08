#!/bin/bash
pm2 stop nodejs-sisbib
pm2 start --name nodeks-sisbib app.js
