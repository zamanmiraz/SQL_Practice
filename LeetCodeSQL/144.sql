# Write your MySQL query statement below
WITH mx_sal_dep AS
    (
        SELECT departmentId, MAX(salary) AS 'mx_salary'
        FROM Employee
        GROUP BY departmentID
    )
SELECT dept.name AS 'Department', emp.name AS 'Employee', emp.salary AS 'Salary'
FROM Employee emp JOIN mx_sal_dep mx ON (emp.salary = mx.mx_salary AND emp.departmentId = mx.departmentID) JOIN Department dept ON mx.departmentId = dept.id;
