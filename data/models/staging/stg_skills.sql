{{
    config(
        tags=['staging']
    )
}}

WITH
required_data AS(
    SELECT 
       *
    FROM {{ source('employe_learning', 'SKILS')}}
),
casted_data As(
    SELECT 
    CAST(_id as VARCHAR) as _id,
    CAST(email as VARCHAR) as email,
    CAST(skills as VARCHAR) as skills,

    from required_data
   
)
select * from casted_data