USE EventPortal;

SELECT
    DATE(registration_date) AS registration_day,
    COUNT(user_id) AS new_user_count
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY DATE(registration_date)
ORDER BY registration_day;
DESCRIBE Users;