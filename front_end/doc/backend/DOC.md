# Documentacao endpoints 

## Login
## HEROKU = https://match-artist.herokuapp.com/

### REQUEST

#### MEHTOD: `POST`

#### ROUTE: `/api/login`

```json
{
    "email": "requried <string>",
    "password": "requried <string>"
}

```

### RESPONSES

#### STATUS: 200

```json
"name":"<string>",
"id":"<int>",
"acess_token": "<string>",
"token_type": "<string>",
"expires_in": "<int>"
```

#### STATUS: 401

Ocorre quando email ou senha esta passado esta incorreto

```json
[
    "Usuario\/Senha invalido"
]
```


## REFRESH
obs: coloca o codigo passado no header na black list e retorna um novo token valido no response
### REQUEST

#### MEHTOD: `GET`

#### ROUTE: `/api/refresh`

#### HEADER parameters

```json

  'Authorization: Bearer acess_token'
  'Content-Type: application/json'

```

### RESPONSES

#### STATUS: 2001

```json
{
    "token_type": "<string>",
    "expires_in": "<int>",
    "token": "<string>"
}
```


## LOGOUT
OBS: coloca tojen jwt na blacklist
### REQUEST

#### MEHTOD: `GET`

#### ROUTE: `/api/logout`

#### HEADER parameters

```json

  'Authorization: Bearer acess_token'
  'Content-Type: application/json'

```

### RESPONSES

#### STATUS: 200

```json
[
    "ok"
]
```

## Cadastro de artista

### REQUEST

#### MEHTOD: `POST`

#### ROUTE: `/api/artista`

```json
{
    "name" :"requried <string>" ,
    "email" : "requried <string>",
    "password": "requried <string>",
    "cpf" : "requried <string>",
    "contato" : "requried <string>",
    "descricao" : "requried <string>",
    "genero":"requried <string>",
    "logradouro" : "requried <string>",
    "complemento" : "requried <string>",
    "numero" : "requried <string>",
    "cidade" : "requried <string>",
    "estado" : "requried <string>"
}

```
### RESPONSES

#### STATUS: 201

```json
[
    "ok"
]
```

#### STATUS: 422
Obs: Ocorre quando o email ja esta cadastrado
```json
{
    "Error": "Email ja cadastrado!!"
}
```


## Listar Artistas

### REQUEST

#### Create: `GET`

obs : Este metodo esta sem retorno paginado e sem query params

#### ROUTE: `/api/artista`


### RESPONSES

#### STATUS: 200

```json
{
    "data": [
        {
            "id": "<int>",
            "nome": "<string>",
            "contato": "4234",
            "descricao": "<string>",
            "genero": "<string>",
            "user_id": "<int>",
            "endereco": {
                "id": "<int>",
                "logradouro": "<string>",
                "complemento": "<string>",
                "numero": "3434",
                "cidade": "<string>",
                "estado": "<string>"
            }
        },
        {
            "id": "<int>",
            "nome": "<string>"",
            "contato": "4234",
            "descricao": "<string>",
            "genero": "<string>",
            "user_id": "<int>",
            "endereco": {
                "id": "<int>",
                "logradouro": "<string>",
                "complemento": "<string>",
                "numero": "<string>",
                "cidade": "<string>",
                "estado": "<string>"
            }
        }
}
```

## Listar as solicitacoes de um artista

### REQUEST

#### Create - MEHTOD: `GET`

obs : Este metodo esta sem retorno paginado e sem query params

#### ROUTE: `/api/agenda/artista/<:id>`

### RESPONSES

#### STATUS: 200

```json
[
    {
        "id": "<int>",
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "estabelecimento": "<string>"
    },
    {
        "id": "<int>",
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "estabelecimento": "<string>"
    },
    {
        "id": "<int>",
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "estabelecimento": "<string>"
    },
    {
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "estabelecimento": "<string>"
    }
]
```

## Cadastro de estabelecimento

### REQUEST

#### MEHTOD: `POST`

#### ROUTE: `/api/estabelecimento`

```json
{
    "name" :"requried <string>" ,
    "email" : "requried <string>",
    "password": "requried <string>",
    "cnpj" : "requried <string>",
    "contato" : "requried <string>",
    "descricao" : "requried <string>",
    "genero":"requried <string>",
    "logradouro" : "requried <string>",
    "complemento" : "requried <string>",
    "numero" : "requried <string>",
    "cidade" : "requried <string>",
    "estado" : "requried <string>"
}

```
### RESPONSES

#### STATUS: 201

```json
[
    "ok"
]
```

#### STATUS: 422
Obs: Ocorre quando o email ja esta cadastrado
```json
{
    "Error": "Email ja cadastrado!!"
}
```


## Listar Estabelecimentos

### REQUEST

#### Create: `GET`

obs : Este metodo esta sem retorno paginado e sem query params

#### ROUTE: `/api/estabelecimento`


### RESPONSES

#### STATUS: 200

```json
{
    "data": [
        {
            "id": "<int>",
            "nome": "<string>",
            "cnpj": "<string>",
            "contato": "4234",
            "descricao": "<string>",
            "user_id": "<int>",
            "endereco": {
                "id": "<int>",
                "logradouro": "<string>",
                "complemento": "<string>",
                "numero": "3434",
                "cidade": "<string>",
                "estado": "<string>"
            }
        },
        {
            "id": "<int>",
            "nome": "<string>",
            "cnpj": "<string>",
            "contato": "4234",
            "descricao": "<string>",
            "user_id": "<int>",
            "endereco": {
                "id": "<int>",
                "logradouro": "<string>",
                "complemento": "<string>",
                "numero": "<string>",
                "cidade": "<string>",
                "estado": "<string>"
            }
        }
}
```

## Listar as solicitacoes de um estabelecimento

### REQUEST

#### Create - MEHTOD: `GET`

obs : Este metodo esta sem retorno paginado e sem query params

#### ROUTE: `/api/agenda/estabelecimento/<:id>`

### RESPONSES

#### STATUS: 200

```json
[
    {
        "id": "<int>",
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "artista": "<string>"
    },
    {
        "id": "<int>",
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "artista": "<string>"
    },
    {
        "id": "<int>",
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "artista": "<string>"
    },
    {
        "solicitante": "<string>",
        "evento": "<string>",
        "is_artista": "<string>",
        "is_estabelecimento": "<string>",
        "artista": "<string>"
    }
]
```




## Enviar solicitacao macth
Obs: endpoint cria a solicitacao do  match entre artista e estabelecimento
### REQUEST

#### MEHTOD: `POST`

#### ROUTE: `/api/agenda`

```json
{
    "solicitante": "<string>",
    "evento": "2022-03-21 02:06:15",
    "is_artista": "<ENUM: SIM|NAO>",
    "is_estabelecimento": "<ENUM: SIM|NAO>",
    "descricao": "<string>",
    "artista_id": "<int>",
    "estabelecimento_id": "<int>"
}

```
### RESPONSES

#### STATUS: 201

```json
[
    "ok"
]
```


## Altera a solicitacao match 
Obs: endpoint altera a solicitação ja criada, realiza o match ou nao, 
dependendo da resposta do artista e estabelecimento
### REQUEST

#### MEHTOD: `PUT`

#### ROUTE: `/api/agenda/<:id>`

Resposta quando for artista:
```json
{
    "is_artista": "<ENUM: SIM|NAO>"
}

```

Resposta quando for estabelecimento:
```json
{
    "is_estabelecimento": "<ENUM: SIM|NAO>"
}

```
### RESPONSES

#### STATUS: 200

```json
[
    "ok"
]
```
}






