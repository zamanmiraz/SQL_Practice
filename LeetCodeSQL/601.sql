with id_grouping AS
    (
        SELECT id, visit_date, people, (id - ROW_NUMBER() OVER()) id_group
        FROM Stadium
        WHERE people >= 100
    ),
group_count AS
    (
        SELECT id_group, COUNT(*) AS cnt
        FROM id_grouping
        GROUP BY id_group
        HAVING cnt >= 3
    )

SELECT ig.id, ig.visit_date, ig.people
FROM id_grouping ig JOIN group_count gc ON ig.id_group = gc.id_group
