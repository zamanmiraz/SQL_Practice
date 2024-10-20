WITH personCountry AS
    (
        SELECT p.id, c.name
        FROM Person p
        JOIN Country c
        ON SUBSTRING(p.phone_number, 1, 3) = c.country_code
    ),

avgDuration AS
    (
        SELECT AVG(duration) AS avg_dur FROM Calls
    )

SELECT pc.name AS country
FROM personCountry pc
JOIN Calls c
ON pc.id = c.caller_id OR pc.id = c.callee_id
GROUP BY pc.name
HAVING AVG(c.duration) > (SELECT avg_dur FROM avgDuration);
