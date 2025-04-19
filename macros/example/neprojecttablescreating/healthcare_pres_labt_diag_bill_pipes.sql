{% macro pres_lbt_diag_bill_mco(database_name,schema_name,pipe_name4,pipe_name5,pipe_name6,pipe_name7) %}
{% set create_pipe4 %}
use database {{database_name}};
use schema {{schema_name}};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name4}}
auto_ingest=true as copy into prescriptions from @healthcare_ext_stg/preslabtdiagbill_csvfiles/prescriptions/
file_format=(format_name=healthcare_csv_format);
{% endset %}
{% do run_query(create_pipe4) %}

{% set create_pipe5 %}
use database {{database_name}};
use schema {{schema_name}};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name5}}
auto_ingest=true as copy into labtests from @healthcare_ext_stg/preslabtdiagbill_csvfiles/labtests/
file_format=(format_name=healthcare_csv_format);
{% endset %}
{% do run_query(create_pipe5) %}

{% set create_pipe6 %}
use database {{database_name}};
use schema {{schema_name}};
create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name6}}
auto_ingest=true as copy into diagnoses from @healthcare_ext_stg/preslabtdiagbill_csvfiles/diagnoses/
file_format=(format_name=healthcare_csv_format);
{% endset %}
{% do run_query(create_pipe6) %}

 {% set create_pipe7%}
 use database {{database_name}};
 use schema {{schema_name}};
 create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name7}}
 auto_ingest=true as copy into billings from @healthcare_ext_stg/preslabtdiagbill_csvfiles/billings/
 file_format=(format_name=healthcare_csv_format);
 {% endset %}
 {% do run_query(create_pipe7) %}

{% endmacro %}