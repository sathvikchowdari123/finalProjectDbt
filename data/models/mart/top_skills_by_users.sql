{{ config(
    tags=['mart']
)}}

with top_skills_by_users as(

select skills,count(distinct email) as count from  {{ ref('stg_skills') }}  group by skills order by count desc
)

select * from top_skills_by_users