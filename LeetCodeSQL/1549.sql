WITH recent_order AS
    (SELECT product_name, O.product_id, MAX(order_date) order_date
    FROM Orders O 
    JOIN Products P
    ON O.product_id = p.product_id
    GROUP BY 1)

SELECT R.product_name, O.product_id, O.order_id, R.order_date
FROM Orders O
JOIN recent_order R
ON O.product_id = R.product_id AND O.order_date = R.order_date
ORDER BY 1, 3
