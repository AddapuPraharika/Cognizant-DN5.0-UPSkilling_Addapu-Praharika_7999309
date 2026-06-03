USE EventPortal;

SELECT
    u.user_id,
    u.full_name,
    u.email,
    u.registration_date
FROM Users u
WHERE NOT EXISTS (
    SELECT 1
    FROM Registrations r
    WHERE r.user_id = u.user_id
      AND r.registration_date >= CURDATE() - INTERVAL 30 DAY
);