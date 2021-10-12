SELECT model_year,
       AVG([list_price]) AS avg_lisr_price
FROM [production].[products]
WHERE list_price >= 832.99
GROUP BY model_year
HAVING MIN([list_price]) > 850
ORDER BY model_year 