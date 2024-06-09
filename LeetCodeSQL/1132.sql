# Find all the post id that are spam i.e., need to left join actions and removals
# Count how many post id are distinct grouping by action_date 
# Count how many post id in the action and removal table are same
# Find average daily percent
SELECT ROUND(AVG(daily_rate)*100, 2) AS average_daily_percent
FROM
    (SELECT COUNT(DISTINCT CASE WHEN act.post_id = rem.post_id THEN act.post_id END)/COUNT(DISTINCT act.post_id) AS daily_rate
    FROM Actions AS act
    LEFT JOIN Removals AS rem
    ON act.post_id = rem.post_id
    WHERE extra = "spam"
    GROUP BY action_date) t0
