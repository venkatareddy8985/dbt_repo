with prescription_cte as(
    select prescription_id,appointment_id,medication_id,dosage,start_date,end_date
    from {{ source('dbt_helhos_src_snf', 'PRESCRIPTION') }}
)
select*from prescription_cte