# Write your MySQL query statement below
# Learn how to use Left Join, Practice CTE, USE NULL
WITH BookOrder_LastYear AS (
    SELECT book_id, quantity
    FROM Orders
    WHERE dispatch_date >= '2018-06-23'
),

BookAvailable_from_LastMonth AS (
    SELECT book_id, name
    FROM Books
    WHERE available_from <= '2019-05-23'
)

SELECT ba.book_id, ba.name
FROM BookAvailable_from_LastMonth ba
LEFT JOIN BookOrder_LastYear bo
ON ba.book_id = bo.book_id
GROUP BY book_id
HAVING SUM(quantity) < 10 OR SUM(quantity) IS NULL;
