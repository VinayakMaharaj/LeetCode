/* Write your PL/SQL query statement below */
SELECT player_id, device_id
FROM (SELECT player_id, device_id, event_date,
    ROW_NUMBER() OVER(PARTITION BY player_id
                      ORDER BY event_date) as e_row
     FROM Activity) t
WHERE t.e_row = 1;