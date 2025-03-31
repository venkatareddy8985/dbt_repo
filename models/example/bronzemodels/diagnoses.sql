with
diagnoses as(
    select
            diagnosis_id,	
            appointment_id,
            diagnosis_description,
            diagnosis_date
    from {{ source('healthcare_snf_src', 'DIAGNOSES') }}
)
select*from diagnoses


