-- total_users.sql

{{ config(
    tags=['mart']
)}}

with total_users as (
    SELECT
        COUNT(*) AS Total_Users
    FROM
        {{ ref('stg_users') }}
)

select * from total_users
