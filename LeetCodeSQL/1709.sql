WITH all_dates AS
    (
        SELECT user_id, visit_date
        FROM UserVisits
        UNION
        SELECT user_id, '2021-1-1' AS visit_date
        FROM UserVisits
    ), 
rank_date AS
    (
        SELECT user_id, visit_date, RANK() OVER(PARTITION BY user_id ORDER BY visit_date) AS date_rnk
        FROM all_dates
    )

SELECT r1.user_id, MAX(DATEDIFF(r2.visit_date, r1.visit_date)) AS biggest_window
FROM rank_date r1 LEFT JOIN rank_date r2 ON r1.user_id = r2.user_id AND r1.date_rnk = r2.date_rnk - 1
GROUP BY 1
