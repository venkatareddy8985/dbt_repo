{% macro pipes_app_pat_doc_mco(database_name,schema_name,pipe_name1,pipe_name2,pipe_name3) %}
{% set create_pipe1 %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name1}} 
auto_ingest=true as copy into appointments from @healthcare_ext_stg/apppatidoc_csvfiles/appointments/
file_format=(format_name=healthcare_csv_format);
{% endset %}
{% do run_query(create_pipe1) %}

{% set create_pipe2 %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name2}} 
auto_ingest=true as copy into doctors from @healthcare_ext_stg/apppatidoc_csvfiles/doctors/
file_format=(format_name=healthcare_csv_format);
{% endset %}
{% do run_query(create_pipe2) %}

{% set create_pipe3 %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name3}} 
auto_ingest=true as copy into patients from @healthcare_ext_stg/apppatidoc_csvfiles/patients/
file_format=(format_name=healthcare_csv_format);
{% endset %}
{% do run_query(create_pipe3) %}

{% endmacro %}