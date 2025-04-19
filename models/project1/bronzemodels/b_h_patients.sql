with patients_cte as(
    select patient_id,first_name,last_name,date_of_birth,gender,address,contact_number,email
    from {{ source('dbt_helhos_src_snf', 'PATIENTS') }}
)
select*from patients_cte