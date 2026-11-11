FROM postgres:16

EXPOSE 5432

# Copia scripts SQL de inicialização (se houver uma pasta 'init' no mesmo diretório)
COPY ./init/ /docker-entrypoint-initdb.d/

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=minhasenha
ENV POSTGRES_DB=meubanco

#Construindo a imagem do Docker com o comando:
# docker build -t meu_postgres:1.0 .

#Para executar o contêiner do PostgreSQL, você pode usar o comando:
# docker run --name postgres-servidor -p 5432:5432 -d meu_postgres:1.0
