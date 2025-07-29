select
    s.*
    , s.quantity*p.purchase_price AS purchase_cost
    , s.revenue - (s.quantity*p.purchase_price)  AS margin

FROM {{ ref('stg_raw__sales') }} AS s
INNER JOIN {{ ref('stg_raw__product') }} AS p
ON s.pdt_id = p.products_id