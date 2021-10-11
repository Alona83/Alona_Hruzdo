SELECT p.product_id,
       p.product_name,
       p.model_year,
       AVG(oi.discount) AS avg_discount

FROM [sales].[orders] o
    INNER JOIN [sales].[order_items] oi
        ON o.order_id = oi.order_id
    INNER JOIN [production].[products] p
        ON p.product_id = oi.product_id
        
WHERE [model_year] IN (2016)


GROUP BY p.product_id,
p.product_name,
p.model_year

HAVING AVG(oi.discount) <= 0.105581 AND AVG(oi.discount) >=0

ORDER BY p.product_id
