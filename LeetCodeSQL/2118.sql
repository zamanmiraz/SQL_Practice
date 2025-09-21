WITH eqnReps AS
    (
        SELECT power,
            CONCAT(CASE
                WHEN factor < 0 THEN '-' 
                ELSE '+' 
            END, 
            CASE
                WHEN power > 1 THEN CONCAT(ABS(factor), "X^", power)
                WHEN power = 1 THEN CONCAT(ABS(factor), "X")
                ELSE ABS(factor)
            END) eqn

    FROM Terms
    )

SELECT CONCAT(GROUP_CONCAT(eqn ORDER BY power DESC SEPARATOR ''), '=0') AS equation 
FROM eqnReps
