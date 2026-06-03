USE EventPortal;

SELECT
    e.event_id,
    e.title AS event_name
FROM Events e
LEFT JOIN Sessions s
    ON e.event_id = s.event_id
WHERE s.session_id IS NULL;
DESCRIBE Events;
DESCRIBE Sessions;
SELECT * FROM Events;
SELECT * FROM Sessions;
