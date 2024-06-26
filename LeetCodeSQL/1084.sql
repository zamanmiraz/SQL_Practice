# Write your MySQL query statement below
SELECT S.product_id, P.product_name
FROM Sales S
JOIN Product P
ON S.product_id = P.product_id 
GROUP BY P.product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';
