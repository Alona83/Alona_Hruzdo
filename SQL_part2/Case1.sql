SELECT p.product_id,
       p.product_name,
       SUM(ISNULL((oi.list_price - oi.list_price * oi.discount), 0.0)) AS total_sales,
       CASE
           WHEN p.product_name LIKE '%[_2018]' THEN
               '2018'
       END AS last_four_letters,
                 CASE
           WHEN SUM(ISNULL((oi.list_price - oi.list_price * oi.discount), 0.0)) = 0 THEN
               'No sales'
           WHEN SUM(ISNULL((oi.list_price - oi.list_price * oi.discount), 0.0)) < 2000 THEN
               'Bad'
           WHEN SUM(ISNULL((oi.list_price - oi.list_price * oi.discount), 0.0)) > 5000 THEN
               'Excellent'
           ELSE
               'Good'
       END AS Product_category
FROM sales.orders o
FULL OUTER JOIN sales.order_items oi
        ON o.order_id = oi.order_id
    FULL OUTER JOIN production.products p
        ON p.product_id = oi.product_id
WHERE (product_name LIKE '%Surly%' AND product_name LIKE '%_2018%')
GROUP BY p.product_id,
         p.product_name
ORDER BY total_sales DESC