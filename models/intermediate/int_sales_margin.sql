SELECT 
    s.orders_id
    , s.products_id
    , s.date_date
    , s.revenue
    , s.quantity
    , p.purchase_price
    ,ROUND((s.quantity * p.purchase_price), 2) AS purchase_cost
    ,ROUND((s.revenue - (s.quantity * p.purchase_price)), 2) AS margin
    ,{{margin_percent('revenue', 's.quantity * p.purchase_price')}} AS margin_percent
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
USING (products_id)