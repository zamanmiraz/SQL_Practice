WITH mx_month AS (
    SELECT id, MAX(month) AS mx
    FROM Employee
    GROUP BY id
)
SELECT 
    e1.id, 
    e1.month, 
    e1.salary + IFNULL(e2.salary, 0) + IFNULL(e3.salary, 0) AS Salary
FROM Employee e1
JOIN mx_month ON e1.id = mx_month.id AND e1.month < mx_month.mx
LEFT JOIN Employee e2 ON e1.id = e2.id AND e1.month = e2.month + 1
LEFT JOIN Employee e3 ON e1.id = e3.id AND e1.month = e3.month + 2
ORDER BY e1.id, e1.month DESC;
