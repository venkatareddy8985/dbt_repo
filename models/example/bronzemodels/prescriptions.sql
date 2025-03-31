with
prescriptions as(
    select 
            prescription_id,
            appointment_id,
            medication_id,
            dosage,
            start_date,
            end_date
    from {{ source('healthcare_snf_src', 'PRESCRIPTIONS') }}
)
select*from prescriptions
