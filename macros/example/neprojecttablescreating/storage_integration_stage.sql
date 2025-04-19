{% macro healthcare_storage_integration_stage_mco(database_name, schema_name, integration_name, stage_name) %}
{% set create_sto_int %}
CREATE OR REPLACE STORAGE INTEGRATION {{ integration_name }}
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::743938722121:role/dbt_healthcare_fulldata_role'
STORAGE_ALLOWED_LOCATIONS = ('s3://dbthealthcarefulldatas3bucket/')
COMMENT = 'Integration with AWS S3 bucket for healthcare data';
{% endset %}
{% do run_query(create_sto_int) %}

{% set create_stage %}
USE DATABASE {{ database_name }};
USE SCHEMA {{ schema_name }};
CREATE OR REPLACE STAGE {{ database_name }}.{{ schema_name }}.{{ stage_name }}
STORAGE_INTEGRATION = {{ integration_name }}
URL = 's3://dbthealthcarefulldatas3bucket/'
FILE_FORMAT = dbt_helhos_csv_format;
{% endset %}
{% do run_query(create_stage) %}
{% endmacro %}

--dbt run-operation healthcare_storage_integration_stage_mco --args "{'database_name':'dbt_helhos_db','schema_name':'dbt_helhos_sc','integration_name':'dbt_helhos_sto_int','stage_name':'dbt_helhos_ext_stg'}"


