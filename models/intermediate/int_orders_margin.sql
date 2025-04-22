SELECT m.orders_id
      ,m.revenue
      ,m.quantity
      ,m.purchase_cost
      ,m.margin
      ,s.date_date
FROM {{ref("int_sales_margin")}} m
JOIN {{ref("stg_raw__sales")}} s
GROUP BY date_date