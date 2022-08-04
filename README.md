# nodejs-sisbib

nodejs-sisbib é o backend da aplicação SiSBiB.

## Instalação

Utilize o gerenciador de pacotes **npm**

```bash
npm install
```

## Configuração

1. É necessário criar um arquivo **.env** na raiz do projeto

```bash
PORT=3000
HOST=localhost
DB_USER=username
DB_PASSWORD=password
DB_NAME=esap
```
2. Também é necessário criar uma base chamada **esap** no MySQL

```bash
CREATE DATABASE esap;
```
para que o Sequelize crie as tabelas necessárias.

3. No caso do servidor de produção, configurar o CORS:

Backend: app.js

Frontend: /src/services/apiurl.js

## License

[MIT](https://choosealicense.com/licenses/mit/)