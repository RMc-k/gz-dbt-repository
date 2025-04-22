SELECT 
  m.orders_id
  ,m.date_date
  ,m.margin
  ,s.logcost
  ,s.shipping_fee
  ,s.ship_cost
  ,ROUND((m.margin + s.shipping_fee - s.logcost - s.ship_cost),2) AS operational_margin
FROM {{ref("int_orders_margin")}} m
JOIN {{ref("stg_raw__ship")}} s
  USING (orders_id)