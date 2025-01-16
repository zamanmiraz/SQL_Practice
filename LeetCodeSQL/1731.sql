WITH mgr_details AS
    (
        SELECT reports_to AS employee_id, COUNT(employee_id) AS reports_count, ROUND(AVG(age)) AS average_age
        FROM Employees 
        WHERE reports_to IS NOT NULL
        GROUP BY reports_to
        ORDER BY reports_to
    )
SELECT m.employee_id, e.name, m.reports_count, m.average_age
FROM mgr_details m LEFT JOIN Employees e ON m.employee_id = e.employee_id
