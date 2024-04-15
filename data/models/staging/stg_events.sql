{{
    config(
        tags=['staging']
    )
}}

WITH
required_data AS(
    SELECT 
       *
    FROM {{ source('employe_learning', 'EVENTS')}}
),
casted_data As(
    SELECT 
    CAST(_id as VARCHAR) as _id,
    CAST(name as VARCHAR) as name,
    CAST(location as VARCHAR) as location,
    CAST(seats as INT) as seats,
     TO_DATE(DATE, 'YYYY-MM-DD') AS date,
    TO_TIME(start_time) as start_time ,
    TO_TIME(end_time) as end_time ,
    CAST(description as VARCHAR) as description
    from required_data
   
)
select * from casted_data