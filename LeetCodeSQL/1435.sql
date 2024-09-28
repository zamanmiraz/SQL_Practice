# Creating a derived table of bin T1
# Create duration, bin T2
# Left join T1.bin = T2.bin
WITH timebin AS
    (
        SELECT '[0-5>' AS bin
        UNION ALL
        SELECT '[5-10>' 
        UNION ALL
        SELECT '[10-15>' 
        UNION ALL
        SELECT '15 or more'
    )

SELECT t.bin, COUNT(s.duration) AS total
FROM timebin t 
LEFT JOIN
    (SELECT duration,
        (CASE 
            WHEN duration / 60 >= 0 AND duration / 60 < 5 THEN '[0-5>'
            WHEN duration / 60 >= 5 AND duration / 60 < 10 THEN '[5-10>'
            WHEN duration / 60 >= 10 AND duration / 60 < 15 THEN '[10-15>'
            ELSE '15 or more'
        END) AS bin FROM Sessions) s 
ON s.bin = t.bin 
GROUP BY t.bin;
