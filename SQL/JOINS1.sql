select p.product_id, 
p.product_name, 
p.model_year,

AVG(ISNULL(oi.discount, 0.0)) AS avg_discount
from [production].[products] p
LEFT JOIN [sales].[order_items] oi
        ON p.product_id = oi.product_id
where p.model_year = 2016


group by p.product_id, p.product_name, p.model_year
HAVING AVG(ISNULL(oi.discount, 0.0)) <= 0.105581 AND AVG(ISNULL(oi.discount, 0.0)) >=0
ORDER BY p.product_id