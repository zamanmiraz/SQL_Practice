# Write your MySQL query statement below
# s > d > e
WITH product_2018 AS
    (
        SELECT s.product_id, p.product_name, "2018" report_year, (DATEDIFF(LEAST(s.period_end, '2018-12-31'), GREATEST(s.period_start, '2018-01-01')) + 1) * s.average_daily_sales AS total_amount
        FROM Sales s LEFT JOIN Product p ON s.product_id = p.product_id
        WHERE YEAR(period_start) <= 2018 AND YEAR(period_end) >= 2018
    ),
product_2019 AS
    (
        SELECT s.product_id, p.product_name, "2019" report_year, (DATEDIFF(LEAST(s.period_end, '2019-12-31'), GREATEST(s.period_start, '2019-01-01')) + 1) * s.average_daily_sales AS total_amount
        FROM Sales s LEFT JOIN Product p ON s.product_id = p.product_id
        WHERE YEAR(period_start) <= 2019 AND YEAR(period_end) >= 2019
    ),
product_2020 AS
    (
        SELECT s.product_id, p.product_name, "2020" report_year, (DATEDIFF(LEAST(s.period_end, '2020-12-31'), GREATEST(s.period_start, '2020-01-01')) + 1) * s.average_daily_sales AS total_amount
        FROM Sales s LEFT JOIN Product p ON s.product_id = p.product_id
        WHERE YEAR(period_start) <= 2020 AND YEAR(period_end) >= 2020
    )

SELECT * 
FROM (
    SELECT * FROM product_2018
    UNION ALL
    SELECT * FROM product_2019
    UNION ALL
    SELECT * FROM product_2020
) yrs
ORDER BY product_id, report_year
