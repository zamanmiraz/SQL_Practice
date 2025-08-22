WITH RECURSIVE series_transaction AS (
    SELECT 0 AS transactions_count
    UNION ALL
    SELECT transactions_count + 1
    FROM series_transaction
    WHERE transactions_count < (
        SELECT MAX(transactions_count)
        FROM (
            SELECT v.user_id, v.visit_date, COUNT(t.transaction_date) AS transactions_count
            FROM Visits v
            LEFT JOIN Transactions t
            ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
            GROUP BY v.user_id, v.visit_date
        ) AS visit_transaction_counts
    )
),
visit_transaction_counts AS (
    SELECT v.user_id, v.visit_date, COUNT(t.transaction_date) AS transactions_count
    FROM Visits v
    LEFT JOIN Transactions t
    ON v.user_id = t.user_id AND v.visit_date = t.transaction_date
    GROUP BY v.user_id, v.visit_date
),
group_transaction AS (
    SELECT transactions_count, COUNT(*) AS visits_count
    FROM visit_transaction_counts
    GROUP BY transactions_count
)

SELECT s.transactions_count, IFNULL(g.visits_count, 0) AS visits_count
FROM series_transaction s
LEFT JOIN group_transaction g
ON s.transactions_count = g.transactions_count
ORDER BY s.transactions_count;
