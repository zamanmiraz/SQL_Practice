SELECT C.customer_id, C.customer_name 
FROM 
    (
        SELECT customer_id
        FROM Orders
        GROUP BY customer_id
        HAVING SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) > 0
        AND SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) > 0
        AND SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0
    ) O 
    LEFT JOIN Customers C ON O.customer_id = C.customer_id;
