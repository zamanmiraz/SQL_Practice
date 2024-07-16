SELECT country_name, (CASE 
                        WHEN SUM(weather_state)/COUNT(w.country_id) <= 15 THEN 'Cold'
                        WHEN SUM(weather_state)/COUNT(w.country_id) >= 25 THEN 'Hot'
                        ELSE 'Warm'
                    END) AS weather_type 
FROM Weather w JOIN Countries c
ON w.country_id = c.country_id
WHERE MONTH(day) = 11 AND YEAR(day) = 2019
GROUP BY w.country_id
