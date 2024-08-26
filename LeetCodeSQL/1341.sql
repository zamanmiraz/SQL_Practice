SELECT name, rating, MAX(rating) AS mx_rating
FROM
    (SELECT name, COUNT(*) AS rating
    FROM MovieRating mv
    JOIN Users usr
    ON mv.user_id = usr.user_id
    GROUP BY mv.user_id) T

-- SELECT name, COUNT(*) AS max_rating
-- FROM MovieRating mv
-- JOIN Users usr
-- ON mv.user_id = usr.user_id
-- GROUP BY mv.user_id
