# Write your MySQL query statement below
WITH relation_rank AS
    (
        SELECT r1.user_id user1_id, r2.user_id user2_id, RANK() OVER(ORDER BY COUNT(*) DESC) rnk
        FROM Relations r1 JOIN Relations r2 ON r1.user_id < r2.user_id AND r1.follower_id = r2.follower_id
        GROUP BY 1, 2
    )

SELECT user1_id, user2_id
FROM relation_rank 
WHERE rnk = 1;
