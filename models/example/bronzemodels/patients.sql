with
patients as(
    select
            patient_id,
            first_name,
            last_name,
            date_of_birth,
            gender,
            address,
            contact_number,
            email
    from {{ source('healthcare_snf_src', 'PATIENTS') }}
)
select*from patients
