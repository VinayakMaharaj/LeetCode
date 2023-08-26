# Write your MySQL query statement below
with a as (SELECT *,
        RANK() OVER(PARTITION BY exam_id ORDER BY score) as 'min',
        RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) as 'max'
FROM Exam
)

SELECT DISTINCT a.student_id, s.student_name
FROM a
LEFT JOIN Student s
on a.student_id = s.student_id
WHERE a.student_id not in (SELECT student_id FROM a WHERE min=1 or max=1  )
ORDER BY a.student_id