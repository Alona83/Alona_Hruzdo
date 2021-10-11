SELECT model_year,
       AVG([list_price]) AS avg_lisr_price
FROM [production].[products]
WHERE model_year IN  (2016, 2019)
AND [list_price] >= 832.99
GROUP BY model_year
HAVING MIN([list_price]) >= 850
ORDER BY model_year 