# Write your MySQL query statement below
# Nested Query
SELECT seller_id
FROM
    (SELECT seller_id, SUM(price) AS total_price_sum
        FROM Sales
        GROUP BY seller_id
        HAVING total_price_sum = 
                        (SELECT MAX(total_price) FROM
                            (SELECT SUM(price) AS total_price
                            FROM Sales
                            GROUP BY seller_id) AS price_sum)) AS get_id;

# If we use CTE we can create an Aggregate Function
WITH aggregated_sales AS (
    SELECT seller_id, SUM(price) AS total_price
        FROM Sales
        GROUP BY seller_id
)
SELECT seller_id
FROM aggregated_sales
WHERE total_price = (SELECT MAX(total_price) FROM aggregated_sales) 
