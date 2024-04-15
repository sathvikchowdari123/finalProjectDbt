{{ config(
    tags=['mart']
)}}

with top_events_by_likes as(

SELECT
    e.name AS event_name,
    e.location AS event_location,
    count(l._id) as count
FROM
    {{ ref('stg_events') }} e
JOIN
    {{ ref('stg_likes') }} l ON e._id = l.eventId
GROUP BY
    e.name, e.location
ORDER BY
    COUNT(l._id) DESC
LIMIT
    10

)

select * from top_events_by_likes