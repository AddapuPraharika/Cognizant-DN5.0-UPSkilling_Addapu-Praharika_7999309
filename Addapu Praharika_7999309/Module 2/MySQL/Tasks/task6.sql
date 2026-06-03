USE EventPortal;

SELECT
    e.event_id,
    e.title AS event_name,
    COUNT(CASE WHEN r.resource_type = 'PDF' THEN 1 END) AS pdf_count,
    COUNT(CASE WHEN r.resource_type = 'Image' THEN 1 END) AS image_count,
    COUNT(CASE WHEN r.resource_type = 'Link' THEN 1 END) AS link_count,
    COUNT(r.resource_id) AS total_resources
FROM Events e
LEFT JOIN Resources r
    ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY e.event_id;