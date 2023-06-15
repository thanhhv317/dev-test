
-- điểm trung bình >= 8

SELECT students.id,
    students.name as studentName,
    AVG(score*coefficient) / COUNT(DISTINCT (subject_id)) as "average score" 
FROM students
JOIN transcript t on students.id = t.student_id
group By students.id, students.name
HAVING AVG(score*coefficient) / COUNT(DISTINCT (subject_id)) >= 8

-- Ngữ văn, Toán, tiếng Anh có ít nhất một môn >= 8 => length >=2

SELECT t.subject_id, SUM(score*t.coefficient )/ SUM(t.coefficient) as tbm
FROM students
JOIN transcript t on students.id = t.student_id
group by t.subject_id
having  tbm >= 8

-- không có môn nào dưới 6.5 => length ==0
SELECT t.subject_id, SUM(score*t.coefficient )/ SUM(t.coefficient) as tbm
FROM students
JOIN transcript t on students.id = t.student_id
group by t.subject_id
having  tbm <= 6.5


--- Ket qua
