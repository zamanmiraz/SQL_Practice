# Write your MySQL query statement below
WITH purchase_count_year AS
    (
        SELECT product_id, YEAR(purchase_date) purchase_year, COUNT(*) AS order_number
        FROM Orders
        GROUP BY 1, 2
    ),

product_purchase AS
    (
        SELECT product_id, (purchase_year - LAG(purchase_year) OVER(PARTITION BY product_id ORDER BY purchase_year)) year_diff
        FROM purchase_count_year
        WHERE order_number >= 3
    )

SELECT DISTINCT product_id
FROM product_purchase
WHERE year_diff = 1;
