USE EventPortal;
SHOW TABLES;

SELECT
    e.event_id,
    e.title AS event_name,
    ROUND(AVG(f.rating), 2) AS average_rating,
    COUNT(f.feedback_id) AS feedback_count
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(f.feedback_id) >= 10
ORDER BY average_rating DESC;