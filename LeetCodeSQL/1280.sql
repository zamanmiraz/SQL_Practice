WITH cnt AS 
    (   
        SELECT student_id, subject_name, COUNT(*) AS attended_exams 
        FROM Examinations 
        GROUP BY student_id, subject_name
    ),
std_sub AS
    (
        SELECT student_id, student_name, subject_name, 0 AS attended_exams
        FROM Students, Subjects 
    )
SELECT std_sub.student_id, std_sub.student_name, std_sub.subject_name, COALESCE(std_sub.attended_exams + cnt.attended_exams, 0) AS attended_exams
FROM std_sub LEFT JOIN cnt ON std_sub.student_id = cnt.student_id AND std_sub.subject_name = cnt.subject_name
ORDER BY student_id, subject_name
