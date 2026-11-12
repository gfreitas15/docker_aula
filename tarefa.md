# Construir o docker com um postgres e pelo menos duas tabelas

## Tabelas

### ⁠Usuário

 ID | nome | email | senha | username
| - | - | - | - | - |
___
### ⁠Cliente

 ID | Nome fantasia | Razao social | CPF/CNPJ | Tipo | Email
| - | - | - | - | - | - |
___
### ⁠Produto

| ID | Descricao | Departamento | Codigo de Barras | Preco
| - | - | - | - | - |
___

 Enviar o link do git com o Dockerfile ou docker.compose e o script

 # Como rodar

1º - Abrir o Docker Desktop

2º - Utilizar o comando

 ```bash
docker compose up -d --build
 ```

 3º - Conectar no banco

 ```bash
 docker exec -it tarefa_postgres_db psql -U admin -d meubanco
```

4º - Fazer as pesquisas, exemplo:

```sql
SELECT * FROM usuario;
SELECT * FROM cliente;
SELECT * FROM produto;
```

Caso seja alterado algo no [Tabela](init/tabelas.sql), será preciso recriar o banco para aplicar a mudança.

```bash
docker compose down -v
docker compose up -d --build
```