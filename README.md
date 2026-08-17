# Projeto ZOOP Megastore

Análise de dados do Checkpoint AD-01 (Alura) — loja virtual fictícia de tecnologia e cultura geek.

## Sobre

O projeto analisa o desempenho de vendas do primeiro trimestre de 2023 da Zoop Megastore, respondendo a perguntas estratégicas da diretoria: quais categorias e estados geram mais receita, e qual o impacto do programa de assinatura ZOOP Prime.

## Tecnologias

- **Python** (Pandas, Matplotlib) — exploração, limpeza e visualização dos dados
- **MySQL 8.0** — banco de dados relacional para armazenamento e consultas
- **Power BI Desktop** — relatório interativo com mapas, gráficos e measures DAX
- **Jupyter Notebook** — ambiente de análise exploratória (Etapa 1)
- **OpenCode** (agente de IA) — assistência na criação de scripts, documentação e auxílio nas etapas do projeto

## Etapas

| # | Etapa | Status |
|---|---|---|
| 1 | Exploração e limpeza dos dados | Concluída |
| 2 | Estruturação do banco de dados | Concluída |
| 3 | Análise geográfica e de clientes | Concluída |
| 4 | Dashboard estratégico e recomendações | Concluída |

## Dados

- **Período:** Janeiro–Março de 2023 (Q1)
- **Vendas:** 120 registros · **Clientes:** 50 (45 ativos)
- **Faturamento total:** R$ 810.828,88
- **Categoria líder:** Periféricos (38% do faturamento)
- **Estado líder:** Santa Catarina (R$ 168.706,83)

## Estrutura do repositório

```
data/
  raw/            ← CSVs originais (vendas, clientes)
  processed/      ← Dados limpos pelo notebook
notebooks/        ← Análise exploratória com Pandas
sql/              ← Scripts de criação, importação e consultas
powerbi/          ← Relatório Power BI (.pbix) e valores de referência
```
