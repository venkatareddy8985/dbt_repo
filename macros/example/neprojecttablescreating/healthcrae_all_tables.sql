{% macro healthcrae_all_tables_mco(database_name,schema_name,table_name1,table_name2,table_name3,table_name4,
table_name5,table_name6,table_name7) %}
{% set create_db %}
create or replace database {{database_name}};
{% endset %}
{% do run_query(create_db) %}

{% set create_sc %}
create or replace schema {{database_name}}.{{schema_name}};
{% endset %}
{% do run_query(create_sc) %}

{% set create_tbl1 %}
create or replace table {{database_name}}.{{schema_name}}.{{table_name1}}
(
    doctor_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    specialty varchar(100),
    contact_number varchar(15),
    email varchar(100)
);
{% endset %}   
{% do run_query(create_tbl1) %}

{% set create_tbl2 %}
create or replace  table {{database_name}}.{{schema_name}}.{{table_name2}}
(
    patient_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    gender varchar(10),
    address varchar(255),
    contact_number varchar(15),
    email varchar(100)
);
{% endset %}   
{% do run_query(create_tbl2) %}

{% set create_tbl3 %}
create or replace  table {{database_name}}.{{schema_name}}.{{table_name3}}
(
    prescription_id int primary key,
    appointment_id int,
    medication_id int,
    dosage varchar(50),
    start_date date,
    end_date date
);
{% endset %}   
{% do run_query(create_tbl3) %}

{% set create_tbl4 %}
create or replace table {{database_name}}.{{schema_name}}.{{table_name4}}
(
    test_id int primary key,
    patient_id int,
    test_name varchar(100),
    test_date date,
    test_result text,
    test_notes text
);
{% endset %}   
{% do run_query(create_tbl4) %}

{% set create_tbl5 %}
create or replace table {{database_name}}.{{schema_name}}.{{table_name5}}
(
    diagnosis_id int primary key,
    appointment_id int,
    diagnosis_description text,
    diagnosis_date date
);
{% endset %}   
{% do run_query(create_tbl5) %}

{% set create_tbl6 %}
create or replace table {{database_name}}.{{schema_name}}.{{table_name6}}
(
    billing_id int primary key,
    patient_id int,
    appointment_id int,
    amount_due decimal(10,2),
    payment_status varchar(50)
);
{% endset %}   
{% do run_query(create_tbl6) %}

{% set create_tbl7 %}
create or replace  table {{database_name}}.{{schema_name}}.{{table_name7}}
(
    appointment_id int primary key,
    patient_id int,
    doctor_id int,
    appointment_date timestamp,
    reason varchar(255),
    status varchar(50)
);
{% endset %}   
{% do run_query(create_tbl7) %}

{% endmacro %}

--- dbt run-operation healthcrae_all_tables_mco --args "{'database_name':'dbt_helhos_db','schema_name':'dbt_helhos_sc',
'table_name1':'DOCTORS','table_name2':'PATIENTS','table_name3':'PRESCRIPTION','table_name4':'LABTESTS','table_name5':'DIAGNOSES',
'table_name6':'BILLINGS','table_name7':'APPOINTMENTS'}"