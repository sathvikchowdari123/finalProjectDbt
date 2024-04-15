{{ config(
    tags=['mart']
)}}

with user_engagement_rate as(
    SELECT
    COUNT(DISTINCT u._id) AS active_users,
    (SELECT COUNT(*) FROM {{ ref('stg_users') }} ) AS total_users,
    (COUNT(DISTINCT u._id) / (SELECT COUNT(*) FROM {{ ref('stg_users') }} )) * 100 AS engagement_rate
FROM
     {{ ref('stg_users') }} u
JOIN
     {{ ref('stg_userregistrations') }} ur ON u.email = ur.email

)

select * from user_engagement_rate