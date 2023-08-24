# Write your MySQL query statement below

SELECT DISTINCT l.account_id
FROM LogInfo l, LogInfo l2
WHERE l.account_id = l2.account_id
AND l2.logout >= l.login and l.login >= l2.login
AND l.ip_address != l2.ip_address 