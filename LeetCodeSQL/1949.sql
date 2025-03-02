WITH friendship_union AS
    (
        SELECT user1_id, user2_id FROM friendship
        UNION
        SELECT user2_id, user1_id FROM friendship
    )
-- find x friend and find y friend then find the mutual friend of both x and y
SELECT f1.user1_id, f1.user2_id, COUNT(*) common_friend
FROM friendship_union f1 JOIN friendship_union f2 ON f1.user1_id = f2.user1_id
                         JOIN friendship_union f3 ON f1.user2_id = f3.user1_id AND f2.user2_id = f3.user2_id
GROUP BY 1, 2
HAVING common_friend >= 3 AND f1.user1_id < f1.user2_id
