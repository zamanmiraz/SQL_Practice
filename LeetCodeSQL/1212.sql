WITH host AS
    (SELECT team_id, team_name, SUM(
        CASE 
            WHEN host_goals > guest_goals THEN 3 
            WHEN host_goals < guest_goals THEN 0
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END
    ) AS points
    FROM Teams LEFT JOIN Matches ON Matches.host_team = Teams.team_id
    GROUP BY team_id),
guest AS
    (SELECT team_id, SUM(
        CASE 
            WHEN host_goals < guest_goals THEN 3 
            WHEN host_goals > guest_goals THEN 0
            WHEN host_goals = guest_goals THEN 1
            ELSE 0
        END
    ) AS points
    FROM Teams LEFT JOIN Matches ON Matches.guest_team = Teams.team_id
    GROUP BY team_id)

SELECT host.team_id, team_name, host.points + guest.points AS num_points
FROM host, guest
WHERE host.team_id = guest.team_id
ORDER BY num_points DESC, team_id ASC
