with billings_cte as(
    select billing_id,patient_id,appointment_id,amount_due,payment_status
    from {{ source('dbt_helhos_src_snf', 'BILLINGS') }}
)
select*from billings_cte