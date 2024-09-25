SELECT left_operand, operator, right_operand, (CASE 
            WHEN operator = '>' AND V.value > V1.value THEN 'true'
            WHEN operator = '<' AND V.value < V1.value THEN 'true'
            WHEN operator = '=' AND V.value = V1.value THEN 'true' 
            ELSE 'false' 
        END) AS value 
FROM Expressions E 
JOIN Variables V ON E.left_operand = V.name 
JOIN Variables V1 ON E.right_operand = V1.name
