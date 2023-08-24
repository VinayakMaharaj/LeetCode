# Write your MySQL query statement below
select id, name
from Students s
where department_id not in
(select id from Departments);