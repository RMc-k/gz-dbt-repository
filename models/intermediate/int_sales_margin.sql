SELECT  sales.orders_id
       ,sales.products_id
       ,sales.date_date
       ,sales.quantity
       ,sales.revenue
       ,product.purchase_price
       ,sales.quantity * product.purchase_price AS purchase_cost
       ,ROUND(sales.revenue - (sales.quantity * product.purchase_price), 2) AS margin
FROM {{ ref('stg_raw__sales')}} sales
JOIN {{ ref('stg_raw__product')}} product  
ON sales.products_id = product.products_id