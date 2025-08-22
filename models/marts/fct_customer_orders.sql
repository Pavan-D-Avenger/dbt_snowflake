-- models/fct_customer_orders.sql
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(o.order_id) as number_of_orders
from {{ ref('stg_jaffle_shop__customers') }} c
left join {{ ref('stg_jaffle_shop__orders') }} o
    on c.customer_id = o.customer_id
group by 1, 2, 3
