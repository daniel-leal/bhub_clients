[![codecov](https://codecov.io/gh/daniel-leal/bhub_clients/branch/main/graph/badge.svg?token=0I5AOXOJC2)](https://codecov.io/gh/daniel-leal/bhub_clients)

![elixir workflow](https://github.com/daniel-leal/bhub_clients/actions/workflows/elixir.yml/badge.svg)

# BhubClients

Este é o repositório do serviço gerenciador de clientes da BHub.

# Pré-requisitos

- Elixir 1.13.2
- Erlang OTP 25
- Postgres > 9.6

# Rodando a aplicacão:

- Existe um arquivo chamado `.tool-versions` para caso você utilize o
  [asdf](https://github.com/asdf-vm/asdf). Execute `asdf install`.
- Instalar o elixir com suas dependencias `mix deps.get`
- Se necessário, altere as credencias e host do banco de dados em `config/dev.exs`
- Criar e migrar o banco de dados `mix ecto.setup`
- Rodar o endpoint do phoenix `mix phx.server`

Agora você pode acessar [`localhost:4000/api/swagger`](http://localhost:4000) no seu
navegador

# Utilizando o docker

```shell
$ docker-compose build
$ docker-compose run --rm phoenix mix deps.get # baixar as dependências
$ docker-compose run --rm phoenix mix deps.compile # compilar as dependências
$ docker-compose run --rm phoenix mix ecto.setup # criar e migrar o db
```

# Endpoints

```
GET /api/clients
GET /api/clients/{id}
POST /api/clients
PATCH/PUT /api/clients/{id}
PATCH/PUT /api/clients/{id}?disable=true
```
