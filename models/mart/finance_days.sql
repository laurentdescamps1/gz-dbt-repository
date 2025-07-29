SELECT
    a.date_date as date_date
    , count(a.orders_id) AS count_orders
    , sum(b.revenue) as revenue
    , sum(b.revenue)/count(a.orders_id) AS avg_basket
    , sum(a.operational_margin) as operational_margin
    , sum(b.purchase_cost) as purchase_cost
    , sum(c.shipping_fee) as tot_shipping_fee
    , sum(c.logcost) as tot_log_cost
    

FROM {{ ref('int_orders_operational') }} AS a
INNER JOIN {{ ref('int_orders_margin') }} AS b
using(orders_id)
inner join {{ ref('stg_raw__ship') }} as c
using(orders_id)

group by 1