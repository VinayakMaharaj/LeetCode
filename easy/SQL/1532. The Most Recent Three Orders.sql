# Write your MySQL query statement below
select name customer_name, a.customer_id, a.order_id, a.order_date from (select o.customer_id, order_id, order_date, 
rank() over(partition by customer_id order by order_date desc) as ranks from Orders o) a
left join Customers c
on c.customer_id=a.customer_id
where ranks<=3
order by customer_name, a.customer_id, a.order_date desc