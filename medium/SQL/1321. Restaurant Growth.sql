# Write your MySQL query statement below
SELECT DISTINCT customer.visited_on, sum(c.amount) amount,                  ROUND(SUM(c.amount) / 7, 2) average_amount FROM customer
JOIN customer c ON c.visited_on BETWEEN                                 DATE_SUB(customer.visited_on, interval 6 day) AND customer.visited_on
WHERE customer.visited_on >= DATE_ADD((SELECT MIN(visited_on) FROM customer),
interval 6 day)
GROUP BY customer.visited_on, customer.customer_id
ORDER BY customer.visited_on;