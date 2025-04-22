SELECT orders_id
      ,date_date
      ,revenue
      ,quantity
      ,purchase_cost
      ,margin
FROM int_sales_margin
GROUP BY date_date