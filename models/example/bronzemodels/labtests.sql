with
labtests as(
    select
            test_id,
            patient_id,
            test_name,
            test_date,
            test_result,
            test_notes
    from {{ source('healthcare_snf_src', 'LABTESTS') }}
)
select*from labtests
