WITH total AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)

SELECT t1.visited_on, 
       SUM(t2.amount) AS amount, 
       ROUND(SUM(t2.amount) / 7, 2) AS average_amount 
FROM total t1 
JOIN total t2 
ON t2.visited_on BETWEEN t1.visited_on - INTERVAL 6 DAY AND t1.visited_on
GROUP BY t1.visited_on
HAVING COUNT(t2.visited_on) = 7;
