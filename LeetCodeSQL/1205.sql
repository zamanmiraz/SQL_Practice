# Write your MySQL query statement below

# Full Join = Left Join Union Right Join

# 1. Left Join:
    # 1.1. Find approved count, approved amount using group by month & country
    # 1.2. Find chargeback count, chargeback amount by joining chargeback table with transaction table
# Left join above two steps (1.1. & 1.2.) on month and country

# 2. Right Join: 2.1. and 2.2. Same as steps 1.1 and 1.2
# Right join above 2.1 and 2.2

# Full Join = 1 UNION 2

WITH T1 AS 
    (
        SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, country, COUNT(state) AS approved_count, SUM(amount) AS approved_amount
        FROM Transactions
        WHERE state = 'approved'
        GROUP BY month, country
    ),
T2 AS
    (
        SELECT DATE_FORMAT(C.trans_date, '%Y-%m') AS month, country, COUNT(state) AS chargeback_count, SUM(amount) AS chargeback_amount
        FROM Chargebacks C
        JOIN Transactions T ON C.trans_id = T.id
        GROUP BY month, country
    )

-- Perform the right join part
SELECT 
    COALESCE(T1.month, T2.month) AS month,
    COALESCE(T1.country, T2.country) AS country,
    COALESCE(T1.approved_count, 0) AS approved_count,
    COALESCE(T1.approved_amount, 0) AS approved_amount,
    COALESCE(T2.chargeback_count, 0) AS chargeback_count,
    COALESCE(T2.chargeback_amount, 0) AS chargeback_amount
FROM T1 LEFT JOIN T2
ON T1.month = T2.month AND T1.country = T2.country

UNION

-- Perform the right join part

SELECT 
    COALESCE(T1.month, T2.month) AS month,
    COALESCE(T1.country, T2.country) AS country,
    COALESCE(T1.approved_count, 0) AS approved_count,
    COALESCE(T1.approved_amount, 0) AS approved_amount,
    COALESCE(T2.chargeback_count, 0) AS chargeback_count,
    COALESCE(T2.chargeback_amount, 0) AS chargeback_amount
FROM T1 RIGHT JOIN T2
ON T1.month = T2.month AND T1.country = T2.country
