SELECT name, SUM(amount) balance
FROM Users U JOIN Transactions T ON U.account = T.account
GROUP BY U.account
HAVING balance > 10000
