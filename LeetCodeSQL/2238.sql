# Write your MySQL query statement below
WITH unique_driver AS
    (
        SELECT DISTINCT driver_id
        FROM Rides
    )

SELECT r1.driver_id, COUNT(passenger_id) AS cnt
FROM unique_driver r1 LEFT JOIN Rides r2 ON r1.driver_id = r2.passenger_id
GROUP BY r1.driver_id



% More optimized

SELECT r1.driver_id, COUNT(DISTINCT r2.ride_id) cnt
FROM Rides r1 LEFT JOIN Rides r2 ON r1.driver_id = r2.passenger_id
GROUP BY r1.driver_id
