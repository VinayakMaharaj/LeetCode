# Write your MySQL query statement below
SELECT DISTINCT title
FROM TVProgram T
INNER JOIN Content C
ON T.content_id = C.content_id
AND C.Kids_content = "Y"
AND T.program_date LIKE "%2020-06%"
AND C.content_type = "Movies";