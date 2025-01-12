WITH aggregated_calls AS (
    SELECT 
        LEAST(from_id, to_id) AS person1,
        GREATEST(from_id, to_id) AS person2,
        COUNT(*) AS call_count,
        SUM(duration) AS total_duration
    FROM Calls
    GROUP BY LEAST(from_id, to_id), GREATEST(from_id, to_id)
)
SELECT person1, person2, SUM(call_count) AS call_count, SUM(total_duration) AS total_duration
FROM aggregated_calls
GROUP BY person1, person2;
