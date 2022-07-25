# nodejs-sisbib

nodejs-sisbib é o backend da aplicação SiSBiB.

## Instalação

Utilize o gerenciador de pacotes **npm**

```bash
npm install
```

## Configuração

É necessário criar um arquivo **.env** na raiz do projeto

```bash
PORT=3000
HOST=localhost
DB_USER=username
DB_PASSWORD=password
DB_NAME=esap
```
Também é necessário criar uma base chamada **esap** no MySQL

```bash
CREATE DATABASE esap;
```
para que o Sequelize crie as tabelas necessárias.

## License

[MIT](https://choosealicense.com/licenses/mit/)