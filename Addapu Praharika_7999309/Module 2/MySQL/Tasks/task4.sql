USE EventPortal;

SELECT
    e.event_id,
    e.title AS event_name,
    COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s
    ON e.event_id = s.event_id
WHERE TIME(s.start_time) >= '10:00:00'
  AND TIME(s.start_time) < '12:00:00'
GROUP BY e.event_id, e.title
ORDER BY session_count DESC;