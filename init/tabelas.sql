CREATE TABLE IF NOT EXISTS usuario (
    id        SERIAL PRIMARY KEY,
    nome      VARCHAR(100) NOT NULL,
    email     VARCHAR(255) NOT NULL UNIQUE,
    senha     VARCHAR(255) NOT NULL,
    username  VARCHAR(50)  NOT NULL UNIQUE
);

-- Sequência para gerar os IDs do cliente (1, 2, 3...), guardados como texto
CREATE SEQUENCE IF NOT EXISTS cliente_id_seq;

CREATE TABLE IF NOT EXISTS cliente (
    id             VARCHAR(20)  PRIMARY KEY DEFAULT nextval('cliente_id_seq')::text,
    nome_fantasia  VARCHAR(150),
    razao_social   VARCHAR(150) NOT NULL,
    cpf_cnpj       VARCHAR(14)  NOT NULL UNIQUE,
    tipo           CHAR(1)      NOT NULL CHECK (tipo IN ('F', 'J')), -- F = físico (CPF), J = jurídico (CNPJ)
    email          VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS produto (
    id              SERIAL PRIMARY KEY,
    descricao       VARCHAR(200)   NOT NULL,
    departamento    VARCHAR(100),
    codigo_barra    CHAR(13)       UNIQUE,
    preco           NUMERIC(10, 2) NOT NULL CHECK (preco >= 0)
);

INSERT INTO usuario (nome, email, senha, username) VALUES
    ('Administrador', 'admin@exemplo.com', '123456', 'admin');

INSERT INTO cliente (nome_fantasia, razao_social, cpf_cnpj, tipo, email) VALUES
    ('Loja Exemplo', 'Loja Exemplo', '12345678000199', 'J', 'contato@lojaexemplo.com'),
    (NULL, 'Gabriel de Freitas', '12345678901', 'F', 'gabriel@gmail.com');

INSERT INTO produto (descricao, departamento, codigo_barra, preco) VALUES
    ('Arroz 5kg', 'Mercearia', '7891234567890', 29.90),
    ('Detergente 500ml', 'Limpeza', '7899876543210', 2.49);
