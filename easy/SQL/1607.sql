# Write your MySQL query statement below
SELECT s.seller_name
FROM Seller s
WHERE s.seller_id NOT IN (
		SELECT seller_id 
		FROM Orders 
		WHERE YEAR(sale_date) = 2020
	)
ORDER BY s.seller_name ASC