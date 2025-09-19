# Write your MySQL query statement below
WITH groupSnrJnr AS
    (
        SELECT employee_id, experience, salary, SUM(salary) OVER(PARTITION BY experience ORDER BY salary, employee_id) cumlSal
        FROM Candidates
    ),
balforJnrHire AS
    (
        SELECT 70000 - IFNULL(MAX(cumlSal), 0) jnr
        FROM groupSnrJnr
        WHERE experience = 'Senior' AND cumlSal <= 70000
    )

SELECT employee_id
FROM groupSnrJnr
WHERE (experience = 'Senior' AND cumlSal <= 70000) OR (experience='Junior' AND cumlSal <= (SELECT * FROM balforJnrHire))
