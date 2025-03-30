{{
    config(
        materialized='table'
    )
}}
with
source_data as(
    select 11 id,'srinu' name
    union all
    select 12 id,'suresh' name
    union all 
    select 13 id,'prabha' name
    union all
    select 14 id,'subbaddi' name
)
select*from source_data