WITH order_count AS
    (SELECT customer_id, product_id, RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(product_id) DESC) AS rnk
    FROM Orders
    GROUP BY customer_id, product_id)

SELECT oc.customer_id, oc.product_id, p.product_name 
FROM order_count oc JOIN Products p ON oc.product_id = p.product_id
WHERE rnk = 1
