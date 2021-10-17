SELECT 
       model_year,
       p.product_id,
       p.product_name,
       (SUM(oi.list_price - oi.list_price * oi.discount)) AS sum_sales
FROM [sales].[orders] o
INNER JOIN [sales].[order_items] oi
        ON o.order_id = oi.order_id
    INNER JOIN [production].[products] p
        ON p.product_id = oi.product_id

GROUP BY model_year,
         p.product_id,
         p.product_name
ORDER BY p.product_id 
