select
    orders_id
    , date_date
    , round(SUM(revenue),2) as revenue
    , sum(quantity) as quantity
    , round(sum(purchase_cost),2) as purchase_cost
    , round(sum(margin),2) as margin

FROM {{ ref('int_sales_margin') }}
GROUP BY 1,2
ORDER BY 1 desc