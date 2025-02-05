WITH employee_rank AS
    (
        SELECT employee_id, department_id, primary_flag , COUNT(*) OVER(PARTITION BY employee_id) AS cnt
        FROM Employee
    )

SELECT employee_id,  department_id
FROM employee_rank
WHERE cnt = 1 OR (primary_flag = 'Y')
