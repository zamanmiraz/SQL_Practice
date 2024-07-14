-- Using 3 subqueries AND union
-- WITH eid_boss_1 AS
--         (SELECT employee_id
--         FROM Employees
--         WHERE manager_id = 1 AND employee_id != 1),
-- eid_boss_2 AS (
--     SELECT employee_id
--     FROM Employees
--     WHERE manager_id IN (SELECT employee_id FROM eid_boss_1)
--     ),
-- eid_boss_3 AS (
--     SELECT employee_id
--     FROM Employees
--     WHERE manager_id IN (SELECT employee_id FROM eid_boss_2)
--     )
-- SELECT * FROM eid_boss_1 UNION
-- SELECT * FROM eid_boss_2 UNION
-- SELECT * FROM eid_boss_3

-- Using 3 Employee id and 
-- We got first manager E1.manager_id = 1 so E1.employee_id are the first manager
-- Now we need to find out E1.employee and E2.manager_id are same, hence E2 employee are the new manager
-- Similarly for E3
SELECT E3.employee_id
FROM Employees E1, Employees E2, Employees E3
WHERE E1.manager_id = 1 AND E3.employee_id != 1 AND E1.employee_id = E2.manager_id AND E2.employee_id = E3.manager_id


