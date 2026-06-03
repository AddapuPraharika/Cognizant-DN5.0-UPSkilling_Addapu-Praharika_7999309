USE EventPortal;

SELECT
    e.event_id,
    e.title AS event_name
FROM Events e
LEFT JOIN Resources r
    ON e.event_id = r.event_id
WHERE r.event_id IS NULL;
SELECT * FROM Resources;