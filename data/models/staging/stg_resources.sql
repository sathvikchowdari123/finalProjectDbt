{{
    config(
        tags=['staging']
    )
}}

WITH
required_data AS(
    SELECT 
       *
    FROM {{ source('employe_learning', 'RESOURCES')}}
),
casted_data As(
    SELECT 
    CAST(_id as VARCHAR) as _id,
    CAST(name as VARCHAR) as name,
    CAST(description as VARCHAR) as description,
    CAST(type as VARCHAR) as type,
    CAST(externallink as VARCHAR) as externallink,
     CAST(blogcontent as VARCHAR) as blogcontent,
    
    from required_data
   
)
select * from casted_data