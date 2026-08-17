-- ============================================================
-- Dados de REFERENCIA para validacao da Etapa 3 (Power BI)
-- Extrai do MySQL os valores que o relatorio DEVE reproduzir
-- ============================================================
USE zoop_megastore;

SELECT '=== 1. FATURAMENTO POR ESTADO (para o Mapa) ===' AS info;
SELECT c.estado,
       COUNT(*)                 AS qtd_vendas,
       ROUND(SUM(v.faturamento), 2) AS faturamento
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.estado
ORDER BY faturamento DESC;

SELECT '=== 2. FATURAMENTO CATEGORIA x ESTADO (barras empilhadas) ===' AS info;
SELECT c.estado,
       v.categoria,
       ROUND(SUM(v.faturamento), 2) AS faturamento
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.estado, v.categoria
ORDER BY c.estado, faturamento DESC;

SELECT '=== 3. METRICAS DOS CARDS ===' AS info;
SELECT ROUND(SUM(faturamento), 2)                        AS faturamento_total,
       ROUND(SUM(faturamento) / COUNT(DISTINCT id_cliente), 2) AS media_por_cliente,
       COUNT(DISTINCT id_cliente)                        AS clientes_ativos
FROM vendas;

SELECT '=== 4. DISTRIBUICAO ZOOP PRIME (slicer) ===' AS info;
SELECT c.plano_assinatura,
       COUNT(DISTINCT c.id_cliente) AS clientes,
       ROUND(SUM(v.faturamento), 2) AS faturamento,
       ROUND(SUM(v.faturamento) / COUNT(DISTINCT c.id_cliente), 2) AS media_por_cliente
FROM clientes c
LEFT JOIN vendas v ON v.id_cliente = c.id_cliente
GROUP BY c.plano_assinatura;

SELECT '=== 5. FATURAMENTO POR MES (Etapa 4 - tendencia) ===' AS info;
SELECT mes,
       COUNT(*)                 AS qtd_vendas,
       ROUND(SUM(faturamento), 2) AS faturamento
FROM vendas
GROUP BY mes
ORDER BY mes;

SELECT '=== 6. TOP 5 PRODUTOS (Etapa 4 - ranking) ===' AS info;
SELECT produto, ROUND(SUM(faturamento), 2) AS faturamento
FROM vendas
GROUP BY produto
ORDER BY faturamento DESC
LIMIT 5;
