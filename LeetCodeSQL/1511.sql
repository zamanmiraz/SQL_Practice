SELECT c.customer_id, c.name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Product p ON o.product_id = p.product_id
WHERE YEAR(order_date) = 2020
GROUP BY c.customer_id
HAVING 
  SUM(
      IF(MONTH(order_date) = 6, quantity, 0) * price
  ) >= 100 AND 
  SUM(
      IF(MONTH(order_date) = 7, quantity, 0) * price
  ) >= 100;
