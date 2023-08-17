# Write your MySQL query statement below
SELECT left_operand, operator, right_operand,
CASE 
WHEN operator = "<" AND left_value < right_value THEN "true"
WHEN operator = ">" AND left_value > right_value THEN "true"
WHEN operator = "=" AND left_value = right_value THEN "true"
ELSE "false"
END AS value
FROM 
(SELECT E.left_operand, A.value AS left_value , E.operator, E.right_operand, B.value AS right_value FROM Expressions E
 LEFT JOIN Variables A On E.left_operand = A.name
LEFT JOIN Variables B On E.right_operand = B.name) M ;