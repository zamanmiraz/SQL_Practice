WITH details_call AS
    (
        SELECT caller_id caller1, recipient_id caller2, call_time FROM Calls
        UNION ALL
        SELECT recipient_id caller1, caller_id caller2, call_time FROM Calls
    ),
rankings AS
    (
        SELECT caller1, caller2, RANK() OVER(PARTITION BY caller1, DATE(call_time) ORDER BY TIME(call_time)) rnk1, RANK() OVER(PARTITION BY caller1, DATE(call_time) ORDER BY TIME(call_time) DESC) rnk2
    FROM details_call
    )
SELECT DISTINCT r1.caller1 user_id
FROM rankings r1 JOIN rankings r2 ON r1.caller1 = r2.caller1 AND r1.caller2 = r2.caller2 AND r1.rnk1 = 1 AND r1.rnk1 = r2.rnk2
