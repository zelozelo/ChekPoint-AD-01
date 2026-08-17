-- ============================================================
-- ZOOP Megastore — Etapa 2 | Desafio de SQL
-- Pergunta-chave: "Quais são nossos produtos e clientes mais valiosos?"
--
-- Execute na raiz do repositório:
--   mysql -u root --local-infile=1 < sql/consultas.sql
-- ============================================================

USE zoop_megastore;

-- ============================================================
-- 1. Top 5 produtos que mais geraram faturamento
-- ============================================================
SELECT produto,
       categoria,
       SUM(faturamento)           AS faturamento_total,
       SUM(quantidade)            AS unidades_vendidas
FROM vendas
GROUP BY produto, categoria
ORDER BY faturamento_total DESC
LIMIT 5;

-- ============================================================
-- 2. Top 5 clientes que mais gastaram na loja
-- ============================================================
SELECT c.id_cliente,
       c.nome_cliente,
       c.estado,
       c.plano_assinatura,
       SUM(v.faturamento)         AS total_gasto
FROM vendas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome_cliente, c.estado, c.plano_assinatura
ORDER BY total_gasto DESC
LIMIT 5;

-- ============================================================
-- 3. Faturamento médio por cliente: assinantes ZOOP Prime
--    vs não assinantes
-- ============================================================
SELECT c.plano_assinatura,
       COUNT(DISTINCT c.id_cliente)                        AS qtd_clientes,
       SUM(v.faturamento)                                  AS faturamento_total,
       ROUND(SUM(v.faturamento) / COUNT(DISTINCT c.id_cliente), 2)
                                                            AS faturamento_medio_por_cliente
FROM vendas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.plano_assinatura;
