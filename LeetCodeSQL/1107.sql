WITH aggregate_activity_date AS
    (SELECT user_id, MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity = 'login'
    GROUP BY user_id
    HAVING DATEDIFF('2019-06-30', login_date) <= 90) # date difference between date1 and date 2

SELECT login_date, COUNT(user_id) AS user_count
FROM aggregate_activity_date
-- WHERE DATEDIFF('2019-06-30', login_date) <= 90 
GROUP BY login_date;
