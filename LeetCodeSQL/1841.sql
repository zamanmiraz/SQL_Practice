# Write your MySQL query statement below
WITH home AS
    (
        SELECT home_team_id team_id, home_team_goals goal_for, away_team_goals goal_against, home_team_goals - away_team_goals goal_diff,
                CASE 
                    WHEN home_team_goals > away_team_goals THEN 3
                    WHEN home_team_goals < away_team_goals THEN 0
                    ELSE 1 
                END AS points
        FROM Matches
    ),

away AS
    (
        SELECT away_team_id team_id, away_team_goals goal_for, home_team_goals goal_against, away_team_goals - home_team_goals goal_diff,
                CASE 
                    WHEN home_team_goals > away_team_goals THEN 0
                    WHEN home_team_goals < away_team_goals THEN 3
                    ELSE 1 
                END AS points
        FROM Matches
    ),

home_away AS
    (
        SELECT * FROM home
        UNION ALL
        SELECT * FROM away
    )

SELECT t.team_name, COUNT(*) matches_played, SUM(points) points, SUM(goal_for) goal_for, SUM(goal_against) goal_against, SUM(goal_diff) goal_diff 
FROM home_away ha LEFT JOIN Teams t ON ha.team_id = t.team_id
GROUP BY ha.team_id
ORDER BY points DESC, goal_diff DESC, team_name




