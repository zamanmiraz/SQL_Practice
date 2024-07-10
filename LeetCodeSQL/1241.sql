WITH T1 AS
    (SELECT DISTINCT sub_id AS post_id, 0 AS number_of_comments
    FROM Submissions
    WHERE parent_id IS NULL),

T2 AS (SELECT parent_id AS post_id, COUNT(DISTINCT sub_id) AS number_of_comments
    FROM Submissions
    WHERE parent_id IS NOT NULL
    GROUP BY parent_id)

SELECT T1.post_id, COALESCE(T1.number_of_comments + T2.number_of_comments, 0) AS number_of_comments
FROM T1 LEFT JOIN T2 ON T1.post_id = T2.post_id
ORDER BY T1.post_id
