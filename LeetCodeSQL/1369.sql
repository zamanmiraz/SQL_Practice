WITH ranking AS
    (
        SELECT *, ROW_number() OVER(PARTITION BY username ORDER BY startDate DESC) rnk
        FROM UserActivitY
    ),
mx_ranking AS
    (
        SELECT *, MAX(rnk) OVER(PARTITION BY username) mx_row
        FROM ranking
    )

SELECT username, activity, startDate, endDate
FROM mx_Ranking
where rnk = 2 OR mx_row = 1;
