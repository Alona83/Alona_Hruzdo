SELECT p.product_id,
       p.product_name,
       p.list_price,
       o.order_date, 
       oi.discount
FROM [sales].[orders] o
INNER JOIN [sales].[order_items] oi
        ON o.order_id = oi.order_id
    INNER JOIN [production].[products] p
        ON p.product_id = oi.product_id
           AND p.list_price > 7000
ORDER BY p.product_id 
         
