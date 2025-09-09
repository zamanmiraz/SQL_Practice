# Write your MySQL query statement below
# Orders -> order_id, customer_id
# Items -> item_id
# merge on item_id and group by day of the ordedate  and item_category
# Select all the item_category in the category column and number as the column value for the day
WITH mergeOrderItem AS
    (
        SELECT WEEKDAY(o.order_date) week_day, i.item_category, SUM(o.quantity) total
        FROM Orders o RIGHT JOIN Items i ON o.item_id = i.item_id
        GROUP BY 1, 2
    )


SELECT item_category AS 'CATEGORY', 
SUM(CASE WHEN week_day = 0 THEN total ELSE 0 END) AS 'MONDAY',
SUM(CASE WHEN week_day = 1 THEN total ELSE 0 END) AS 'TUESDAY',
SUM(CASE WHEN week_day = 2 THEN total ELSE 0 END) AS 'WEDNESDAY',
SUM(CASE WHEN week_day = 3 THEN total ELSE 0 END) AS 'THURSDAY',
SUM(CASE WHEN week_day = 4 THEN total ELSE 0 END) AS 'FRIDAY',
SUM(CASE WHEN week_day = 5 THEN total ELSE 0 END) AS 'SATURDAY',
SUM(CASE WHEN week_day = 6 THEN total ELSE 0 END) AS 'SUNDAY'
FROM mergeOrderItem
GROUP BY 1
ORDER BY item_category
