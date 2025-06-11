# TRABALHO - ENGENHARIA DE DADOS - 2025-1

# MEMBROS:
#Edson Etsuji Kitamura
#Felipe Fereirici Trombini
#Jefferson Lira Nebes
#Ricardo Neves Alonso


# Containers
## dbt_compose, dbt-1 (ports 8080:8080) e dbpg-1 (ports 5433:5432) 

# 1. silver_pedidos_completos
Integra clientes, pedidos, e pagamentos para formar uma visão unificada de cada pedido.
Objetivo: preparar os dados para análises analíticas.
Transformações:
Join entre clientes, pedidos, pagamentos


# 2. gold_faturamento_clientes
Agrega o valor total de pagamentos por cliente.
Objetivo: permitir análise de valor gerado por cliente.
Transformações:
Agrupamento por id_cliente
Soma de valor_pagamento
Contagem de pedidos

# 3. gold_evolucao_faturamento_mensal
Foco temporal: total pago mês a mês, com possibilidade de gerar dashboards.
Transformações:
Agrupamento por YEAR(order_date), MONTH(order_date)
