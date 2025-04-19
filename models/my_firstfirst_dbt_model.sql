{{
    config(
        materialized='table'
    )
}}
with source_data as(
    select 1 as id,'praveen' name
    union all
    select null as id,'kumar' name
    union all
    select 2 as id,'reddy' name
    union all
    select 3 id.'suresh' name
    union all
    select 4 id,'srinu' name
)
select*from source_data