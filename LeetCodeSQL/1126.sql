SELECT business_id
FROM Events E
JOIN
    (SELECT event_type, SUM(occurrences )/COUNT(event_type) as avg_occ
    FROM Events
    GROUP BY event_type) AE
ON E.event_type = AE.event_type
WHERE E.occurrences > AE.avg_occ
GROUP BY business_id
HAVING COUNT(business_id) > 1;
