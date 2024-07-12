SELECT DISTINCT page_id AS recommended_page
FROM Likes
WHERE user_id IN (SELECT (CASE
                            WHEN user1_id = 1 THEN user2_id
                            WHEN user2_id = 1 THEN user1_id
                        END) AS uid FROM Friendship)
    AND page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1)
