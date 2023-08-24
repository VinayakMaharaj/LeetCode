/* Write your PL/SQL query statement below */
with CTE (Department, DepartmentId, Salary) AS(
  select 
    d.name, e.departmentId, max(e.salary) as Salary 
  from Employee e 
  join Department d on(d.id = e.departmentId) 
  group by e.departmentId
) 
SELECT 
  CTE.Department, 
  e.name as Employee, 
  CTE.Salary 
FROM CTE 
join Employee e on (
    e.salary = CTE.salary 
    and e.departmentId = CTE.DepartmentId
  )