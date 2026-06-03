USE EventPortal;

SELECT
    e.event_id,
    e.title AS event_name,
    COUNT(DISTINCT r.user_id) AS total_registrations,
    ROUND(AVG(f.rating), 2) AS average_rating
FROM Events e
LEFT JOIN Registrations r
    ON e.event_id = r.event_id
LEFT JOIN Feedback f
    ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id, e.title
ORDER BY e.event_id;