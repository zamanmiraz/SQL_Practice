SELECT DISTINCT lg_ld.num ConsecutiveNums
FROM
    (SELECT num, LAG(num) OVER(ORDER BY id) lg, LEAD(num) OVER(ORDER BY id) ld
    FROM Logs) lg_ld
WHERE lg_ld.num = lg_ld.lg AND lg_ld.num = lg_ld.ld;
