WITH diff AS
    (
        SELECT user_id, DATEDIFF(purchase_date, LAG(purchase_date) OVER(PARTITION BY user_id ORDER BY purchase_date)) date_diff
        FROM Purchases
        ORDER BY purchase_date
    )

SELECT DISTINCT user_id
FROM diff
WHERE date_diff <= 7
ORDER BY user_id;
