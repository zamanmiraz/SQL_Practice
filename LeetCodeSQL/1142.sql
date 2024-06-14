# Write your MySQL query statement below

SELECT ROUND(IFNULL(AVG(count_session), 0.00),2) AS average_sessions_per_user
FROM
    (SELECT user_id, COUNT(DISTINCT(session_id)) AS count_session
    FROM Activity
    WHERE DATEDIFF('2019-07-27', activity_date) < 30
    GROUP BY user_id) T0
