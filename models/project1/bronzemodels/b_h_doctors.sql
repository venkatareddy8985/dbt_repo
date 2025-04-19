with doctors_cte as(
    select doctor_id,first_name,last_name,specialty,contact_number,email
    from {{ source('dbt_helhos_src_snf', 'DOCTORS') }}
)
select*from doctors_cte