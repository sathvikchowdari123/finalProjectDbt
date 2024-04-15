{{ config(
    tags=['mart']
)}}

with top_users_by_event_registrations as(

SELECT
    u._id AS user_id,
    u.firstname,
    u.lastname,
    COUNT(ur._id) AS total_events_registered
FROM
     {{ ref('stg_users') }} u
JOIN
     {{ ref('stg_userregistrations') }} ur ON u.email = ur.email
GROUP BY
    u._id, u.firstname, u.lastname
ORDER BY
    total_events_registered DESC
LIMIT
    10




)

select * from top_users_by_event_registrations