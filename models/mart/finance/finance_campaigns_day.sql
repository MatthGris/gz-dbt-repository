SELECT 
    f.date_date
    ,ROUND(f.operational_margin-c.ads_cost, 2) AS ads_margin
    ,f.average_basket
    ,f.operational_margin
    ,c.ads_cost
    ,c.ads_impression
    ,c.ads_clicks
    ,f.total_quantity AS quantity
    ,f.revenue
    ,f.total_purchase_cost AS purchase_cost
    ,f.margin
    ,f.total_shipping_fee AS shipping_fee
    ,f.total_logcost AS logcost
FROM {{ ref('finance_days') }} AS f
LEFT JOIN {{ ref('int_campaigns_day') }} AS c
USING (date_date)
ORDER BY date_date DESC