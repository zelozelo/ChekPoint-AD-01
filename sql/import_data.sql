-- ============================================================
-- ZOOP Megastore — Etapa 2 | Importação dos dados
-- Carrega os CSVs limpos nas tabelas do banco zoop_megastore.
--
-- Requisitos:
--   1. Servidor MySQL iniciado com --local-infile=1
--   2. Executar na RAIZ do repositório (caminhos relativos)
--
-- Execute na raiz do repositório:
--   mysql -u root --local-infile=1 < sql/import_data.sql
-- ============================================================

USE zoop_megastore;

-- ------------------------------------------------------------
-- clientes  <-  data/raw/clientes.csv        (50 registros)
-- ------------------------------------------------------------
LOAD DATA LOCAL INFILE 'data/raw/clientes.csv'
INTO TABLE clientes
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
       ENCLOSED BY '"'
       ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id_cliente, nome_cliente, email, estado, plano_assinatura);

-- ------------------------------------------------------------
-- vendas  <-  data/processed/vendas_tratado.csv  (120 registros)
-- Arquivo limpo na Etapa 1, com colunas faturamento e mes.
-- ------------------------------------------------------------
LOAD DATA LOCAL INFILE 'data/processed/vendas_tratado.csv'
INTO TABLE vendas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
       ENCLOSED BY '"'
       ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(id_venda, data_venda, id_cliente, id_produto, produto, categoria,
 valor_venda, quantidade, faturamento, mes);

-- ------------------------------------------------------------
-- Conferência rápida após o carregamento
-- ------------------------------------------------------------
SELECT 'clientes' AS tabela, COUNT(*) AS total FROM clientes
UNION ALL
SELECT 'vendas', COUNT(*) FROM vendas;
