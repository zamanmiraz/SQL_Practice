WITH salary_range AS
    (
        SELECT account_id, CASE
                                WHEN income < 20000 THEN "Low Salary"
                                WHEN income > 50000 THEN "High Salary"
                                ELSE "Average Salary" 
                            END AS category
        FROM Accounts
    ),

salary_types AS (  -- Define all possible salary ranges
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

SELECT t.category, IFNULL(COUNT(r.account_id), 0) AS accounts_count 
FROM salary_range r RIGHT JOIN salary_types t ON r.category = t.category
GROUP BY t.category;
