# Write your MySQL query statement below
WITH freq_cuml AS
        (
            SELECT *, SUM(frequency) OVER(ORDER BY num) freq_int, (SUM(frequency) OVER())/2 median_num
            FROM numbers
        )
SELECT AVG(num) AS median
FROM freq_cuml
WHERE median_num BETWEEN (freq_int - frequency) AND freq_int;
