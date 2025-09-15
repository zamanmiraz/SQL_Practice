# Write your MySQL query statement below
# Find out the users who listens to the same song 
# Group by all of them 
# Are they friends? if not return them

WITH allPair AS
    ( # All possible combinations of users with same interests
        SELECT DISTINCT a.user_id,b.user_id recommended_id
        FROM Listens a JOIN Listens b ON a.user_id < b.user_id
        AND a.song_id = b.song_id AND a.day=b.day
        GROUP BY user_id, recommended_id, a.day
        HAVING COUNT(DISTINCT a.song_id) >= 3
    ), 

Half AS
    ( 
        SELECT user_id, recommended_id
        FROM allPair LEFT JOIN Friendship ON user_id=user1_id AND recommended_id=user2_id
        WHERE user1_id IS NULL
    )
# Double it
SELECT user_id,recommended_id FROM Half
UNION ALL
SELECT recommended_id,user_id FROM Half
