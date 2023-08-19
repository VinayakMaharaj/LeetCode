# Write your MySQL query statement below
SELECT w.name AS warehouse_name, SUM(w.units * p.Width * p.Length * p.Height) AS volume
FROM Warehouse AS w
LEFT JOIN Products AS p
USING (product_id)
GROUP BY w.name