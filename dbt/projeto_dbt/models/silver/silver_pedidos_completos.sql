
{{ config(
    materialized='table',
    schema='silver'
) }}

with pedidos as (
    select * from {{ ref('exemplo_incremental_pedidos') }}
),
clientes as (
    select * from {{ ref('exemplo_incremental_clientes') }}
),
pagamentos as (
    select * from {{ ref('exemplo_incremental_pagamentos') }}
)

select
    p.id_pedido,
    p.data_pedido,
    p.status,
    c.id_cliente,
    c.nome_completo,
    pg.valor_pagamento
from pedidos p
left join clientes c on p.id_cliente = c.id_cliente
left join pagamentos pg on p.id_pedido = pg.id_pedido
