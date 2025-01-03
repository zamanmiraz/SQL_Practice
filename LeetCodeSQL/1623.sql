## Cartesian Product ##
SELECT 
    SA.student_name AS member_A, 
    SB.student_name AS member_B, 
    SC.student_name AS member_C
FROM 
    SchoolA SA, 
    SchoolB SB, 
    SchoolC SC
WHERE 
    SA.student_name <> SB.student_name 
    AND SA.student_name <> SC.student_name 
    AND SB.student_name <> SC.student_name
    AND SA.student_id <> SB.student_id 
    AND SA.student_id <> SC.student_id 
    AND SB.student_id <> SC.student_id;

## Cross Join ##
# Write your MySQL query statement below
SELECT 
    SA.student_name AS member_A, 
    SB.student_name AS member_B, 
    SC.student_name AS member_C
FROM 
    SchoolA SA
JOIN 
    SchoolB SB ON SA.student_name <> SB.student_name AND SA.student_id <> SB.student_id
JOIN 
    SchoolC SC ON SA.student_name <> SC.student_name AND SA.student_id <> SC.student_id
                AND SB.student_name <> SC.student_name AND SB.student_id <> SC.student_id;
