SELECT sale_date, SUM(CASE
                        WHEN fruit = 'oranges' THEN -sold_num
                        ELSE sold_num
                    END) AS diff
FROM Sales
GROUP BY sale_date
