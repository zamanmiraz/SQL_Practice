WITH melt_user AS
    (
        SELECT contest_id, gold_medal AS user_id FROM Contests
        UNION ALL
        SELECT contest_id, silver_medal AS user_id FROM Contests
        UNION ALL
        SELECT contest_id, bronze_medal AS user_id FROM Contests
    ),
user_rank AS
    (
        SELECT contest_id, user_id,  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY contest_id) AS rnk
        FROM melt_user
    ),
cont_rank AS
    (
        SELECT DISTINCT user_id
        FROM user_rank
        GROUP BY user_id, contest_id - rnk
        HAVING COUNT(*) >= 3
        UNION
        SELECT gold_medal AS user_id
        FROM Contests
        GROUP BY gold_medal
        HAVING COUNT(*) >= 3
    )

SELECT u.name, u.mail
FROM cont_rank c JOIN Users u ON c.user_id = u.user_id
