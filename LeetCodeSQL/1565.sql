# Write your MySQL query statement below
SELECT DATE_FORMAT(order_date, '%Y-%m') month, COUNT(order_id) order_count, COUNT(DISTINCT customer_id) customer_count
FROM Orders
WHERE invoice > 20
GROUP BY 1
