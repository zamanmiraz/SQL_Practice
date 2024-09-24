SELECT U.name, IFNULL(SUM(R.distance), 0) AS travelled_distance
FROM Rides R
RIGHT JOIN Users U
ON U.id = R.user_id
GROUP BY U.id
ORDER BY travelled_distance DESC, name
