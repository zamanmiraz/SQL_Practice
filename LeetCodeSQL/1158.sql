# Write your MySQL query statement below

# idea join orders and users table
# group by buyer id where order date in 2019
# select buyer_id, join_id, orders_in_2019 (count order_id)

SELECT U.user_id AS buyer_id, U.join_date, count(order_id) AS orders_in_2019 
FROM Users U 
LEFT JOIN Orders O
ON U.user_id = O.buyer_id 
AND YEAR(O.order_date) = '2019'
GROUP BY U.user_id
ORDER BY U.user_id;

"""
Q) Why can't we use WHERE Year is 2019 here?
Because, SQL query is executed in following order:

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY ,
so, it removes the records for which no orders were placed in 2019 way before you can perform a GROUP BY or SELECT(COUNT).
"""
