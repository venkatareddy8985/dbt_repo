with labtests_cte as(
    select test_id,patient_id,test_name,test_date,test_result,test_notes
    from {{ source('dbt_helhos_src_snf', 'LABTESTS') }}
)
select*from labtests_cte