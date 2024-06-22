# First find out the min order date for every customer and create an alias table t1
# Now join table t1 and delivery on order_date and customer_id
# Find the percentage using AVG function just like the previous question

SELECT ROUND(AVG(order_date = customer_pref_delivery_date)*100,2) AS immediate_percentage
FROM
(SELECT customer_id, MIN(order_date) AS mn_ord_date
FROM Delivery
GROUP BY customer_id) t1
JOIN
Delivery ON t1.mn_ord_date = Delivery.order_date AND t1.customer_id = Delivery.customer_id
