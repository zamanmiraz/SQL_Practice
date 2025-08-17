# Write your MySQL query statement below
WITH platform_count AS(
    (
        SELECT user_id, spend_date, 'both' AS platform, SUM(amount) total_amount
        FROM Spending
        GROUP BY spend_date, user_id
        HAVING COUNT(DISTINCT platform) = 2
    )
UNION ALL
    (
        SELECT user_id, spend_date, platform, SUM(amount) total_amount
        FROM Spending
        GROUP BY spend_date, user_id
        HAVING COUNT(DISTINCT platform) = 1        
    )
),

group_platform AS
    (
        SELECT spend_date, platform, SUM(total_amount) total_amount, COUNT(user_id) total_users
        FROM platform_count
        GROUP BY spend_date, platform
    ),

all_platform AS
    (
        SELECT DISTINCT s.spend_date, 'mobile' AS platform 
        FROM Spending s
        UNION ALL
        SELECT DISTINCT s.spend_date, 'desktop' AS platform
        FROM Spending s
        UNION ALL
        SELECT DISTINCT s.spend_date, 'both' AS platform
        FROM Spending s
    )    

SELECT ap.spend_date, ap.platform, IFNULL(gp.total_amount, 0) total_amount, IFNULL(gp.total_users, 0) total_users
FROM all_platform ap LEFT JOIN group_platform gp ON ap.spend_date = gp.spend_date AND ap.platform = gp.platform
