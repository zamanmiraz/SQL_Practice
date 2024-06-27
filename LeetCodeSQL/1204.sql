SELECT person_name
FROM
    (SELECT person_id, person_name, turn,
    SUM(weight) OVER(ORDER BY turn) AS roll_weight
    FROM Queue) T1
WHERE roll_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
