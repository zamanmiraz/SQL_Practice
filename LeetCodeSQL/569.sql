WITH rank_salary AS (
    SELECT id, company, salary, RANK() OVER (PARTITION BY company ORDER BY salary, id) AS rnk
    FROM Employee  
),
mx_rank AS (
    SELECT company, 
           (MAX(rnk) + (MAX(rnk) % 2)) / 2 AS rnk1, (MAX(rnk) + (MAX(rnk) % 2))/2 + (1 - (MAX(rnk) % 2)) AS rnk2
        --    CASE 
        --        WHEN MAX(rnk) % 2 = 0 THEN MAX(rnk) / 2 + 1 
        --        ELSE (MAX(rnk) + 1) / 2 
        --    END AS rnk2
    FROM rank_salary
    GROUP BY company
)

-- SELECT * FROM mx_rank;

SELECT r.id, r.company, r.salary
FROM rank_salary r JOIN mx_rank m ON (r.company = m.company) AND (r.rnk = m.rnk1 OR r.rnk = m.rnk2);
