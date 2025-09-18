# Write your MySQL query statement below
WITH cte AS (
    SELECT employee_id, experience, salary,
           SUM(salary) OVER (PARTITION BY experience ORDER BY salary, employee_id) AS cum_salary
    FROM candidates
    ),
maxSenSal AS
    (
        SELECT 70000 - IFNULL(MAX(cum_salary), 0) remFund
        FROM cte
        WHERE experience = 'Senior' AND cum_salary <=70000
    )
SELECT 'Senior' AS experience, COUNT(*) AS accepted_candidates
FROM cte
WHERE cum_salary <= 70000 AND experience = 'Senior'

UNION ALL

SELECT 'Junior' AS experience, COUNT(*) AS accepted_candidates
FROM cte
WHERE cum_salary <= (SELECT * FROM maxSenSal) AND experience = 'Junior'
