SELECT name warehouse_name, SUM(Width*Length*Height*units) volume
FROM Warehouse W
JOIN Products P
ON W.product_id = P.product_id
GROUP BY 1
