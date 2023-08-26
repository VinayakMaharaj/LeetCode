# Write your MySQL query statement below
WITH recursive a as

(
SELECT *
FROM Tasks t

UNION ALL

SELECT task_id, subtasks_count -1
FROM a
WHERE subtasks_count >=2

)

SELECT  a.task_id, a.subtasks_count as subtask_id
FROM a
LEFT JOIN Executed e
on a.task_id = e.task_id and a.subtasks_count = e.subtask_id
WHERE e.subtask_id is null