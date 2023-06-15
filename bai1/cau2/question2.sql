

SELECT students.id, 
    students.name as studentName, 
    c.name as className, 
    s.name as schoolName, 
    YEAR(t.school_year) as "year as school",
    AVG(score*coefficient) / COUNT(DISTINCT (subject_id)) as "average score" 
FROM students
JOIN classes c on students.class_id = c.id
JOIN schools s on c.school_id = s.id
JOIN transcript t on students.id = t.student_id
WHERE students.id = 1
group By students.id, students.name, c.name, s.name, t.school_year