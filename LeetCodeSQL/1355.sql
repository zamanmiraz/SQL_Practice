# Find the total number of participants by grouping the activity from the Friends table
# Find all the activity name where there is no maximum and minimum participants
WITH participant_count AS
    (
        SELECT activity, COUNT(*) AS participants
        FROM Friends
        -- FROM Friends f RIGHT JOIN Activities a
        -- ON f.activity = a.name
        GROUP BY activity
    ),
mx_mn_count AS
    (
        SELECT MAX(participants) AS mx, MIN(participants) AS mn
        FROM participant_count
    )

SELECT activity
FROM participant_count, mx_mn_count
WHERE participants != mx AND participants != mn
