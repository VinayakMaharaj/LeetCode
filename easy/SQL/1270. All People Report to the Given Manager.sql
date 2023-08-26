# Write your MySQL query statement below
select e1.employee_id
from Employees e1
left join Employees e2
on e2.employee_id = e1.manager_id
left join Employees e3
on e3.employee_id = e2.manager_id
where (e1.manager_id = 1 
or e2.manager_id = 1
or e3.manager_id = 1)
and (e1.employee_id != e1.manager_id
or e2.employee_id != e2.manager_id
or e3.employee_id != e3.manager_id);