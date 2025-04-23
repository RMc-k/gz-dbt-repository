{{ config ( materialized = 'view' ) }}

SELECT 
    fin.date_date AS date_date
    ,ROUND(fin.operational_margin - cam.ads_cost, 2) AS ads_margin
    ,fin.average_basket
    ,fin.operational_margin
    ,fin.nb_transactions
    ,fin.total_revenue
    ,cam.ads_cost
    ,cam.ads_impression
    ,cam.ads_clicks
    ,fin.total_purchase_cost
    ,fin.total_shipping_fee
    ,fin.total_logcost
    ,fin.total_quantity_sold
FROM {{ ref("finance_days") }} fin
LEFT JOIN {{ ref('int_campaigns_day') }} cam
ON fin.date_date = cam.date_date
GROUP BY date_date
         ,fin.nb_transactions
         ,fin.total_revenue
         ,fin.average_basket
         ,fin.operational_margin
         ,cam.ads_cost
         ,cam.ads_impression
         ,cam.ads_clicks
         ,fin.total_purchase_cost
         ,fin.total_shipping_fee
         ,fin.total_logcost
         ,fin.total_quantity_sold
ORDER BY date_date DESC


