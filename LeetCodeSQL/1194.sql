# Write your MySQL query statement below
WITH players_score AS
    (
        SELECT first_player AS player_id, first_score AS score
        FROM Matches
        UNION ALL
        SELECT second_player AS player_id, second_score AS score
        FROM Matches
    ),
playerScore AS
    (
        SELECT player_id, SUM(score) score
        FROM players_score
        GROUP BY player_id
    ),
player_group AS
    (
        SELECT ps.player_id, ps.score, p.group_id
        FROM playerScore ps LEFT JOIN Players p ON ps.player_id = p.player_id
    ),
rank_player AS
    (
        SELECT player_id, group_id, ROW_NUMBER() OVER(PARTITION BY group_id ORDER BY score DESC, player_id ASC) rnk
        FROM player_group 
    )

SELECT group_id, player_id
FROM rank_player
WHERE rnk = 1;
