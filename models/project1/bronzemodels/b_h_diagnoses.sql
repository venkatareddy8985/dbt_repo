with diagnoses_cte as(
    select diagnosis_id,appointment_id,diagnosis_description,diagnosis_date
    from {{ source('dbt_helhos_src_snf', 'DIAGNOSES') }}
)
select*from diagnoses_cte