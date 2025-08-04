# Write your MySQL query statement below
WITH cont_America AS
    (
        SELECT name AS America, ROW_NUMBER() OVER(ORDER BY name) row_id
        FROM Student
        WHERE continent = 'America'
    ),

cont_Asia AS
    (
        SELECT name AS Asia, ROW_NUMBER() OVER(ORDER BY name) row_id
        FROM Student
        WHERE continent = 'Asia'
    ),

cont_Europe AS
    (
        SELECT name AS Europe, ROW_NUMBER() OVER(ORDER BY name) row_id
        FROM Student
        WHERE continent = 'Europe'
    )

SELECT America, Asia, Europe
FROM cont_America am 
LEFT JOIN cont_Asia a ON am.row_id = a.row_id
LEFT JOIN cont_Europe e ON am.row_id = e.row_id;
