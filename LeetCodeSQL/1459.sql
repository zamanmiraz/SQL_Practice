SELECT P1.id AS p1, P2.id AS p2, ABS(P1.x_value - P2.x_value)*ABS(P1.y_value - P2.y_value) AS area
FROM points P1, points P2
WHERE ABS(P1.x_value - P2.x_value) > 0 AND ABS(P1.y_value - P2.y_value) > 0 AND P1.id < P2.id
ORDER BY area DESC, p1, P2
