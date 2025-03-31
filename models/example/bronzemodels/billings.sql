with
billings as(
    select 
            billing_id,
            patient_id,
            appointment_id,
            amount_due,
            payment_status
    from {{ source('healthcare_snf_src', 'BILLING') }}
)
select * from billings

