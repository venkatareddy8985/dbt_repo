{{
    config(
        materialized='table',
        transient=false
    )
}}

with trans_joins1_cte as(
    select appointment_date,reason,status,
           first_name,last_name,date_of_birth,gender,address,contact_number,email,
           first_name as fn,last_name as ln,specialty,contact_number as cn,email as em,
           prescription_id,medication_id,dosage,start_date,end_date,
           test_id,test_name,test_date,test_result,test_notes,
           diagnosis_id,diagnosis_description,diagnosis_date,
           billing_id,appointment_id,amount_due,payment_status
    from {{ ref('s_h_transformation') }}
)
select*from trans_joins1_cte
