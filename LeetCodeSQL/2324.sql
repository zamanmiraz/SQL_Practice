WITH sales_merge AS
    (
        SELECT user_id, product_id, SUM(quantity) quantity
        FROM Sales
        GROUP BY user_id, product_id
    ),
spend_rnk AS
    (
        SELECT s.user_id, p.product_id, s.quantity*p.price spend, DENSE_RANK() OVER(PARTITION BY s.user_id ORDER BY (s.quantity*p.price) DESC) AS rnk
        FROM sales_merge s LEFT JOIN Product p ON s.product_id = p.product_id
    )

SELECT user_id, product_id
FROM spend_rnk
WHERE rnk = 1
