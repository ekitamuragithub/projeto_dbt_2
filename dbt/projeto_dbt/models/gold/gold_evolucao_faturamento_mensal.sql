
{{ config(
    materialized='table',
    schema='gold'
) }}

with pedidos_pagamentos as (
    select
        p.id_pedido,
        p.data_pedido,
        pg.valor_pagamento
    from {{ ref('exemplo_incremental_pedidos') }} p
    left join {{ ref('exemplo_incremental_pagamentos') }} pg on p.id_pedido = pg.id_pedido
),

agregado as (
    select
        date_trunc('month', data_pedido) as mes,
        sum(valor_pagamento) as faturamento_mensal
    from pedidos_pagamentos
    group by 1
)

select * from agregado
order by mes
