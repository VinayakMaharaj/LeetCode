# Write your MySQL query statement below
WITH deptCount(employee_id, dept_count) AS (
    SELECT employee_id, COUNT(*) AS dept_count 
    FROM Employee 
    GROUP BY employee_id 
    HAVING COUNT(*) = 1
)
SELECT employee_id, department_id FROM Employee 
WHERE primary_flag = 'Y' OR employee_id IN (
    SELECT employee_id FROM deptCount
);