WITH city_rank AS
    (
        SELECT city_id, day, degree, ROW_NUMBER() OVER(PARTITION BY city_id ORDER BY degree DESC, day) cty_rnk
        FROM Weather
    )
SELECT city_id, day, degree
FROM city_rank
WHERE cty_rnk = 1;
