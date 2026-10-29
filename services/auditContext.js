'use strict';

const { AsyncLocalStorage } = require('async_hooks');

const storage = new AsyncLocalStorage();

function runWithContext(context, callback) {
  return storage.run(context || {}, callback);
}

function getContext() {
  return storage.getStore() || {};
}

function setActor(actor) {
  const store = storage.getStore();
  if (store) {
    store.actor = actor;
  }
}

function setRequestMeta({ ip, method, path }) {
  const store = storage.getStore();
  if (store) {
    store.ip = ip;
    store.method = method;
    store.path = path;
  }
}

module.exports = {
  runWithContext,
  getContext,
  setActor,
  setRequestMeta,
};
