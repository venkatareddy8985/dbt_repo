with
doctors as(
    select 
            doctor_id,
            first_name,
            last_name,
            specialty,
            contact_number,
            email
    from {{ source('healthcare_snf_src', 'DOCTORS') }}
)
select*from doctors
