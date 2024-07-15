SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM
    (SELECT log_id, ROW_NUMBER() OVER(ORDER BY log_id) as row_num
    FROM Logs) a
GROUP BY log_id - row_num
