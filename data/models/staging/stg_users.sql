{{
    config(
        tags=['staging']
    )
}}

WITH
required_data AS(
    SELECT 
       *
    FROM {{ source('employe_learning', 'USERS')}}
),
casted_data As(
    SELECT 
    CAST(_id as VARCHAR) as _id,
    CAST(firstname as VARCHAR) as firstname,
    CAST(lastname as VARCHAR) as lastname,
    CAST(email as VARCHAR) as email,
    CAST(username as VARCHAR) as username,
     CAST(password as VARCHAR) as password,
    CAST(role as VARCHAR) as role,
    CAST(experience_data as INT) as experience
    from required_data
   
)
select * from casted_data