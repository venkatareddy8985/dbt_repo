{% macro sale_storage_integration_mco(database_name,schema_name,integration_name,stage_name) %}
{% set create_sto_inte %}
CREATE OR REPLACE STORAGE INTEGRATION {{integration_name}}
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::743938722121:role/salesalltables_proj1_role'
STORAGE_ALLOWED_LOCATIONS =  ('s3://saless3bucketproj1alltables/')
COMMENT = 'Integration with aws s3 and snowflake';
{% endset %}
{% do run_query(create_sto_inte) %}

{% set create_stg %}
USE DATABASE {{database_name}};
USE SCHEMA {{schema_name}};
CREATE OR REPLACE STAGE {{database_name}}.{{schema_name}}.{{stage_name}}
STORAGE_INTEGRATION = {{integration_name}}
URL = 's3://saless3bucketproj1alltables/'
FILE_FORMAT = sales_dbt_csv_format;
{% endset %}
{% do run_query(create_stg) %}
    
{% endmacro %}