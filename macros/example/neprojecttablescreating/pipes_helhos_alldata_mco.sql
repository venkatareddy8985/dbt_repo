{% macro pipes_helhos_alldata_mco(database_name,schema_name,pipe_name1,pipe_name2,pipe_name3,pipe_name4,pipe_name5,pipe_name6,pipe_name7) %}
{% set create_pipe1 %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name1}} 
auto_ingest=true as copy into appointments from @dbt_helhos_ext_stg/apppatidoc_csvfiles/appointments/
file_format=(format_name=dbt_helhos_csv_format);
{% endset %}
{% do run_query(create_pipe1) %}

{% set create_pipe2 %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name2}} 
auto_ingest=true as copy into doctors from @dbt_helhos_ext_stg/apppatidoc_csvfiles/doctors/
file_format=(format_name=dbt_helhos_csv_format);
{% endset %}
{% do run_query(create_pipe2) %}

{% set create_pipe3 %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name3}} 
auto_ingest=true as copy into patients from @dbt_helhos_ext_stg/apppatidoc_csvfiles/patients/
file_format=(format_name=dbt_helhos_csv_format);
{% endset %}
{% do run_query(create_pipe3) %}

{% set create_pipe4 %}
use database {{database_name}};
use schema {{schema_name}};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name4}}
auto_ingest=true as copy into prescription from @dbt_helhos_ext_stg/preslabtdiagbill_csvfiles/prescriptions/
file_format=(format_name=dbt_helhos_csv_format);
{% endset %}
{% do run_query(create_pipe4) %}

{% set create_pipe5 %}
use database {{database_name}};
use schema {{schema_name}};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name5}}
auto_ingest=true as copy into labtests from @dbt_helhos_ext_stg/preslabtdiagbill_csvfiles/labtests/
file_format=(format_name=dbt_helhos_csv_format);
{% endset %}
{% do run_query(create_pipe5) %}

{% set create_pipe6 %}
use database {{database_name}};
use schema {{schema_name}};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name6}}
auto_ingest=true as copy into diagnoses from @dbt_helhos_ext_stg/preslabtdiagbill_csvfiles/diagnoses/
file_format=(format_name=dbt_helhos_csv_format);
{% endset %}
{% do run_query(create_pipe6) %}

 {% set create_pipe7%}
 use database {{database_name}};
 use schema {{schema_name}};
 create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name7}}
 auto_ingest=true as copy into billings from @dbt_helhos_ext_stg/preslabtdiagbill_csvfiles/billings/
 file_format=(format_name=dbt_helhos_csv_format);
 {% endset %}
 {% do run_query(create_pipe7) %}

{% endmacro %}

---dbt run-operationpipes_helhos_alldata_mco --args "{'database_name':'dbt_helhos_db','schema_name':'dbt_helhos_sc','pipe_name1':'APPOINTMENTS_PIPE_NAME','pipe_name2':'DOCTORS_PIPE_NAME','pipe_name3':'PATIENTS_PIPE_NAME','pipe_name4':'PRESCRIPTIONS_PIPE_NAME','pipe_name5':'LABTESTS_PIPE_NAME','pipe_name6':'DIAGNOSES_PIPE_NAME','pipe_name7':'BILLINGS_PIPE_NAME'}"