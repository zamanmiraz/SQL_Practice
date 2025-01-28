WITH s_email AS
    (
        SELECT email, MIN(id) min_id
        FROM Person
        GROUP BY email
    )

DELETE P
FROM Person P JOIN s_email S ON P.email = S.email
WHERE P.id != S.min_id;
