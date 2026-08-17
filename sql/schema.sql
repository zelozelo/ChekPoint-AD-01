-- ============================================================
-- ZOOP Megastore — Etapa 2 | Esquema do banco de dados
-- Cria o banco zoop_megastore e as tabelas clientes e vendas.
-- Execute na raiz do repositório:
--   mysql -u root --local-infile=1 < sql/schema.sql
-- ============================================================

DROP DATABASE IF EXISTS zoop_megastore;
CREATE DATABASE zoop_megastore
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE zoop_megastore;

-- ------------------------------------------------------------
-- Tabela clientes  (origem: data/raw/clientes.csv)
-- ------------------------------------------------------------
CREATE TABLE clientes (
    id_cliente        INT PRIMARY KEY,
    nome_cliente      VARCHAR(100) NOT NULL,
    email             VARCHAR(100) NOT NULL,
    estado            CHAR(2)      NOT NULL,
    plano_assinatura  VARCHAR(3)   NOT NULL  -- 'Sim' ou 'Nao'
) ENGINE = InnoDB;

-- ------------------------------------------------------------
-- Tabela vendas  (origem: data/processed/vendas_tratado.csv)
-- ------------------------------------------------------------
CREATE TABLE vendas (
    id_venda     INT PRIMARY KEY,
    data_venda   DATE         NOT NULL,
    id_cliente   INT          NOT NULL,
    id_produto   INT          NOT NULL,
    produto      VARCHAR(100) NOT NULL,
    categoria    VARCHAR(50)  NOT NULL,
    valor_venda  DECIMAL(10,2) NOT NULL,
    quantidade   INT          NOT NULL,
    faturamento  DECIMAL(12,2) NOT NULL,
    mes          CHAR(7)      NOT NULL,  -- 'YYYY-MM'
    CONSTRAINT fk_vendas_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
) ENGINE = InnoDB;

-- Índices para acelerar as consultas de agrupamento
CREATE INDEX idx_vendas_cliente ON vendas (id_cliente);
CREATE INDEX idx_vendas_produto ON vendas (id_produto);
CREATE INDEX idx_vendas_categoria ON vendas (categoria);
