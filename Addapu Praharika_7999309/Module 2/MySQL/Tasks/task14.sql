USE EventPortal;

SELECT
    e.event_id,
    e.title AS event_name,
    COUNT(r.user_id) AS total_registrations
FROM Events e
JOIN Registrations r
    ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY total_registrations DESC
LIMIT 3;