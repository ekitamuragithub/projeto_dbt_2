
{{ config(
    materialized='table',
    schema='gold'
) }}

with base as (
    select
        p.id_cliente,
        c.nome_completo,
        pg.valor_pagamento
    from {{ ref('exemplo_incremental_pedidos') }} p
    left join {{ ref('exemplo_incremental_clientes') }} c on p.id_cliente = c.id_cliente
    left join {{ ref('exemplo_incremental_pagamentos') }} pg on p.id_pedido = pg.id_pedido
)

select
    id_cliente,
    nome_completo,
    count(*) as total_pedidos,
    sum(valor_pagamento) as total_pago,
    avg(valor_pagamento) as ticket_medio
from base
group by id_cliente, nome_completo
