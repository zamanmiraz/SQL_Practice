# Write your MySQL query statement below
WITH w AS
    (
        SELECT Wimbledon AS player_id, COUNT(*) AS cnt
        FROM Championships
        GROUP BY Wimbledon
    ),
f AS
    (
        SELECT Fr_open AS player_id, COUNT(*) AS cnt
        FROM Championships
        GROUP BY Fr_open
    ),
u AS
    (
        SELECT US_open AS player_id, COUNT(*) AS cnt
        FROM Championships
        GROUP BY US_open
    ),
a AS
    (
        SELECT Au_open AS player_id, COUNT(*) AS cnt
        FROM Championships
        GROUP BY Au_open
    )

-- SELECT * FROM a
SELECT p.player_id, player_name, IFNULL(w.cnt, 0) + IFNULL(f.cnt, 0) + IFNULL(u.cnt, 0) + IFNULL(a.cnt, 0) grand_slams_count 
FROM 
    Players p
LEFT JOIN w ON p.player_id = w.player_id
LEFT JOIN f ON p.player_id = f.player_id
LEFT JOIN u ON p.player_id = u.player_id
LEFT JOIN a ON p.player_id = a.player_id
HAVING grand_slams_count > 0;

------------------
# Write your MySQL query statement below
SELECT player_id,player_name,
SUM(player_id=Wimbledon)+SUM(player_id=Fr_open)+SUM(player_id=US_open)+SUM(player_id=Au_open)
as grand_slams_count
FROM Players
JOIN Championships
ON player_id=Wimbledon or player_id=Fr_open or player_id=US_open or player_id=Au_open
GROUP BY player_id;
