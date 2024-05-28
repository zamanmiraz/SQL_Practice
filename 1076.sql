# Write your MySQL query statement below
# Wrong 1
-- SELECT project_id
-- FROM
--     (SELECT DISTINCT(project_id) AS project_id, COUNT(*) AS employee_count
--     FROM Project
--     GROUP BY project_id) AS p
-- WHERE employee_count = MAX(employee_count);

# Lesson: MAX function or aggregate function can not be used in the where clause
# Need to use HAVING
# SELECT and HAVING could have the aggregate function
SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT MAX(employee_count)
                                FROM (SELECT  COUNT(*) AS employee_count
                                    FROM Project
                                    GROUP BY project_id) AS sub);

# We can use Two Common Table Expression (CTE) 
# CTE 1 => Empolyee, EmployeeCount
# CTE 2 => MaxEmployeeCount

WITH EmployeeCount AS
    (
        SELECT project_id, COUNT(*) AS employee_count
        FROM Project
        GROUP BY project_id
    ),
MaxEmployeeCount AS
    (
        SELECT MAX(employee_count) AS maxEmployee
        FROM EmployeeCount
    )
SELECT project_id
FROM EmployeeCount
WHERE employee_count = (SELECT maxEmployee FROM MaxEmployeeCount);
