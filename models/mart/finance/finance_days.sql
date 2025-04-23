SELECT 
    o.date_date,
    COUNT(DISTINCT orders_id) AS nb_transactions,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(margin + shipping_fee - logcost - ship_cost), 2) AS operational_margin,
    ROUND(SUM(quantity * purchase_cost), 2) AS total_purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS total_shipping_fee,
    ROUND(SUM(logcost), 2) AS total_logcost,
    ROUND(SUM(quantity), 2) AS total_quantity_sold,
    ROUND(SUM(revenue) / COUNT(DISTINCT orders_id), 2) AS average_basket
FROM {{ ref("int_orders_operational") }} o
GROUP BY o.date_date
ORDER BY o.date_date DESC

