SELECT
EXTRACT(MONTH FROM date_date) AS datemonth
,ROUND(SUM(ads_margin), 2) AS ads_margin
,ROUND(SUM(average_basket), 2) AS average_basket
,ROUND(SUM(operational_margin), 2) AS operational_margin
,ROUND(SUM(ads_cost), 2) AS ads_cost
,ROUND(SUM(ads_impression), 2) AS ads_impression
,ROUND(SUM(ads_clicks), 2) AS ads_clicks
,ROUND(SUM(quantity), 2) AS quantity  
,ROUND(SUM(revenue), 2) AS revenue
,ROUND(SUM(purchase_cost), 2) AS purchase_cost
,ROUND(SUM(margin), 2) AS margin
,ROUND(SUM(shipping_fee), 2) AS shipping_fee
,ROUND(SUM(logcost), 2) AS logcost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY EXTRACT(MONTH FROM date_date)
ORDER BY datemonth DESC