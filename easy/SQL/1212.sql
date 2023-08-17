# Write your MySQL query statement below
SELECT B.team_id, B.team_name, IFNULL(SUM(A.score),0) AS num_points
FROM 
(
SELECT host_team AS ID, 
CASE 
WHEN host_goals > guest_goals THEN 3
WHEN host_goals = guest_goals THEN 1 
ELSE 0
END AS score FROM Matches 
UNION ALL 
SELECT guest_team AS ID,
CASE 
WHEN guest_goals > host_goals THEN 3
WHEN guest_goals = host_goals THEN 1
ELSE 0 
END AS score FROM Matches
) A RIGHT JOIN Teams B ON A.ID = B.team_id GROUP BY B.team_id ORDER BY num_points DESC, team_id ASC