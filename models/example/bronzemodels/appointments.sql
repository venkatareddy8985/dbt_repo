with 
appointments as(
        select 
                appointment_id,	
                patient_id,	
                doctor_id,	
                appointment_date,
                reason,
                status
        from {{ source('healthcare_snf_src', 'APPOINTMENTS') }}
)
select * from appointments      








