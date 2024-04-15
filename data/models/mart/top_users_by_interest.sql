{{ config(
    tags=['mart']
)}}

with top_users_by_interest as(

SELECT
    u._id AS user_id,
    u.firstname,
    u.lastname,
    COUNT(l._id) AS events_interested
FROM
     {{ ref('stg_users') }} u
JOIN
     {{ ref('stg_likes') }} l ON u.email = l.email
GROUP BY
    u._id, u.firstname, u.lastname
ORDER BY
    events_interested DESC
LIMIT
    10




)

select * from top_users_by_interest