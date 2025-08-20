# Write your MySQL query statement below
WITH fail AS
    (
        SELECT fail_date, DATE_SUB(fail_date, INTERVAL ROW_NUMBER() OVER(ORDER BY fail_date) DAY) grp_date, "failed" AS period_state
        FROM Failed
        WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'
    ),
succeded AS
    (
        SELECT success_date, DATE_SUB(success_date, INTERVAL ROW_NUMBER() OVER(ORDER BY success_date) DAY) grp_date, "succeeded" AS period_state
        FROM Succeeded
        WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'        
    ),
merge AS
    (
        SELECT period_state, MIN(fail_date) start_date, MAX(fail_date) end_date
        FROM fail
        GROUP BY grp_date, period_state

        UNION ALL

        SELECT period_state, MIN(success_date) start_date, MAX(success_date) end_date
        FROM succeded
        GROUP BY grp_date, period_state
    )

SELECT * FROM merge
ORDER BY start_date
