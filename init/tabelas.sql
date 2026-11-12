CREATE SEQUENCE IF NOT EXISTS usuario_id_seq;

CREATE TABLE IF NOT EXISTS usuario (
    id        VARCHAR(20)  PRIMARY KEY DEFAULT nextval('usuario_id_seq')::text,
    nome      VARCHAR(100) NOT NULL,
    email     VARCHAR(255) NOT NULL UNIQUE,
    senha     VARCHAR(255) NOT NULL,
    username  VARCHAR(50)  NOT NULL UNIQUE
);

CREATE SEQUENCE IF NOT EXISTS cliente_id_seq;

CREATE TABLE IF NOT EXISTS cliente (
    id             VARCHAR(20)  PRIMARY KEY DEFAULT nextval('cliente_id_seq')::text,
    nome_fantasia  VARCHAR(150),
    razao_social   VARCHAR(150) NOT NULL,
    cpf_cnpj       VARCHAR(14)  NOT NULL UNIQUE,
    tipo           CHAR(1)      NOT NULL CHECK (tipo IN ('F', 'J')), -- F = físico (CPF), J = jurídico (CNPJ)
    email          VARCHAR(255)
);

CREATE SEQUENCE IF NOT EXISTS produto_id_seq;

CREATE TABLE IF NOT EXISTS produto (
    id              VARCHAR(20)    PRIMARY KEY DEFAULT nextval('produto_id_seq')::text,
    descricao       VARCHAR(200)   NOT NULL,
    departamento    VARCHAR(100),
    codigo_barra    CHAR(13)       UNIQUE,
    preco           NUMERIC(10, 2) NOT NULL CHECK (preco >= 0)
);

INSERT INTO usuario (nome, email, senha, username) VALUES
    ('Administrador', 'admin@exemplo.com', '123456', 'admin'),
    ('Gabriel Freitas', 'gabriel.freitas@gmail.com', '123456', 'gabriel.freitas'),
    ('João Silva', 'joao.silva@gmail.com', '123456', 'joao.silva'),
    ('Maria Oliveira', 'maria.oliveira@gmail.com', '123456', 'maria.oliveira'),
    ('Carlos Souza', 'carlos.souza@gmail.com', '123456', 'carlos.souza'),
    ('Ana Pereira', 'ana.pereira@gmail.com', '123456', 'ana.pereira');

INSERT INTO cliente (nome_fantasia, razao_social, cpf_cnpj, tipo, email) VALUES
    ('Loja Exemplo', 'Loja Exemplo', '12345678000199', 'J', 'contato@lojaexemplo.com'),
    (NULL, 'Gabriel de Freitas', '12345678901', 'F', 'gabriel@gmail.com'),
    ('Mercado Central', 'Mercado Central LTDA', '98765432000188', 'J', 'contato@mercadocentral.com'),
    (NULL, 'João Pedro da Silva', '23456789012', 'F', 'joao@gmail.com'),
    ('Tech Solutions', 'Tech Solutions Comércio LTDA', '45678912000177', 'J', 'contato@techsolutions.com'),
    (NULL, 'Maria Oliveira Souza', '34567890123', 'F', 'maria@gmail.com'),
    ('Supermercado Bom Preço', 'Bom Preço Supermercado LTDA', '56789123000166', 'J', 'financeiro@bompreco.com'),
    (NULL, 'Carlos Eduardo Santos', '67890123456', 'F', 'carlos@gmail.com'),
    ('Casa & Cia', 'Casa & Cia Utilidades LTDA', '78901234000155', 'J', 'contato@casaecia.com'),
    (NULL, 'Ana Paula Pereira', '89012345678', 'F', 'ana@gmail.com');

INSERT INTO produto (descricao, departamento, codigo_barra, preco) VALUES
    ('Arroz 5kg', 'Mercearia', '7891234567890', 29.90),
    ('Detergente 500ml', 'Limpeza', '7899876543210', 2.49),
    ('Feijão 1kg', 'Mercearia', '7891111111111', 7.99),
    ('Macarrão 500g', 'Mercearia', '7892222222222', 4.59),
    ('Açúcar 1kg', 'Mercearia', '7893333333333', 4.99),
    ('Café 500g', 'Mercearia', '7894444444444', 18.90),
    ('Leite Integral 1L', 'Laticínios', '7895555555555', 5.49),
    ('Queijo Mussarela 500g', 'Laticínios', '7896666666666', 24.90),
    ('Manteiga 200g', 'Laticínios', '7897777777777', 9.99),
    ('Sabão em Pó 1kg', 'Limpeza', '7898888888888', 12.90),
    ('Amaciante 2L', 'Limpeza', '7899999999999', 14.50),
    ('Papel Higiênico 12un', 'Higiene', '7891010101010', 18.99),
    ('Shampoo 350ml', 'Higiene', '7891212121212', 11.90),
    ('Creme Dental 90g', 'Higiene', '7891313131313', 6.49),
    ('Escova de Dentes', 'Higiene', '7891414141414', 8.90),
    ('Refrigerante 2L', 'Bebidas', '7891515151515', 9.99),
    ('Água Mineral 1,5L', 'Bebidas', '7891616161616', 3.49),
    ('Suco de Uva 1L', 'Bebidas', '7891717171717', 8.99),
    ('Biscoito Recheado', 'Mercearia', '7891818181818', 3.99),
    ('Chocolate 90g', 'Doces', '7891919191919', 6.90),
    ('Bala de Morango 100g', 'Doces', '7892020202020', 4.50),
    ('Pilha AA com 4 unidades', 'Eletrônicos', '7892121212121', 12.99),
    ('Lâmpada LED 9W', 'Casa', '7892223232323', 7.90),
    ('Extensão Elétrica 5m', 'Casa', '7892323232323', 29.90),
    ('Caderno 10 matérias', 'Papelaria', '7892424242424', 21.90);
