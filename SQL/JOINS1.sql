SELECT p.product_id, 
p.product_name, 
p.model_year,

AVG(ISNULL([discount], 0)) AS avg_discount
FROM production.products p
LEFT JOIN sales.order_items s
        ON p.product_id = s.product_id
WHERE p.model_year = 2016


GROUP BY p.product_id, p.product_name, p.model_year
HAVING AVG(ISNULL([discount], 0)) >= 0 OR AVG(ISNULL([discount], 0.0)) = 0.105581
ORDER BY p.product_id