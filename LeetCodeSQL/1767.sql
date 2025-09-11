# Write your MySQL query statement below
WITH RECURSIVE gen AS
    (
        SELECT 1 AS subtask_id
        UNION ALL
        SELECT subtask_id + 1
        FROM gen
        WHERE subtask_id <= 20
    ),
genSubtask AS
    (
        SELECT t.task_id, g.subtask_id
        FROM Tasks t JOIN gen g ON g.subtask_id <= t.subtasks_count 
    )

SELECT g.task_id, g.subtask_id
FROM genSubtask g 
WHERE (g.task_id, g.subtask_id) NOT IN (SELECT * FROM Executed )
