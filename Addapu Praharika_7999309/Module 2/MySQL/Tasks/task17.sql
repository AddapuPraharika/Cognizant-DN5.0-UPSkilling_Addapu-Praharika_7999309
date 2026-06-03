USE EventPortal;

SELECT
    speaker_name,
    COUNT(DISTINCT session_id) AS total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(DISTINCT session_id) > 1
ORDER BY total_sessions DESC;
SELECT * FROM Sessions;