with appointments_cte as(
    select appointment_id,patient_id,doctor_id,appointment_date,reason,status
    from {{ ref('b_h_appointments') }}
),
patients_cte as(
    select patient_id,first_name,last_name,date_of_birth,gender,address,contact_number,email
    from {{ ref('b_h_patients') }}
),
doctors_cte as(
    select doctor_id,first_name,last_name,specialty,contact_number,email
    from {{ ref('b_h_doctors') }}
),
prescription_cte as(
    select prescription_id,appointment_id,medication_id,dosage,start_date,end_date
    from {{ ref('b_h_prescriptions') }}
),
labtests_cte as(
    select test_id,patient_id,test_name,test_date,test_result,test_notes
    from {{ ref('b_h_labtests') }}
),
diagnoses_cte as(
    select diagnosis_id,appointment_id,diagnosis_description,diagnosis_date
    from {{ ref('b_h_diagnoses') }}
),
billings_cte as(
    select billing_id,patient_id,appointment_id,amount_due,payment_status
    from {{ ref('b_h_billings') }}
),
trans_joins1_cte as(
    select ap.appointment_date,ap.reason,ap.status,
           pa.first_name,pa.last_name,pa.date_of_birth,pa.gender,pa.address,pa.contact_number,pa.email,
           dc.first_name as fn,dc.last_name as ln,dc.specialty,dc.contact_number as cn,dc.email as em,
           pr.prescription_id,pr.medication_id,pr.dosage,pr.start_date,pr.end_date,
           te.test_id,te.test_name,te.test_date,te.test_result,te.test_notes,
           di.diagnosis_id,di.diagnosis_description,di.diagnosis_date,
           bi.billing_id,bi.appointment_id,bi.amount_due,bi.payment_status
    from appointments_cte as ap left outer join patients_cte as pa
         on ap.patient_id = pa.patient_id
         left outer join 
         doctors_cte as dc
         on ap.doctor_id = dc.doctor_id
         left outer join
         prescription_cte as pr
         on ap.appointment_id = pr.appointment_id
         left outer join
         labtests_cte as te
         on ap.patient_id = te.patient_id
         left outer join 
         diagnoses_cte as di
         on ap.appointment_id = di.appointment_id
         left outer join 
         billings_cte as bi
         on ap.patient_id = bi.patient_id
)
select*from trans_joins1_cte





