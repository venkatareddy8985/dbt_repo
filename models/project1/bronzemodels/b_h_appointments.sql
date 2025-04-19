with appointments_cte as(
    select appointment_id,patient_id,doctor_id,appointment_date,reason,status
    from {{ source('dbt_helhos_src_snf', 'APPOINTMENTS') }}
)
select*from appointments_cte