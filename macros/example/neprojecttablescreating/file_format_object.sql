{% macro file_format_object_mco(database_name,schema_name,format_name,type,field_delimiter,skip_header) %}
    {% set create_ffobject %}
    create or replace file format {{database_name}}.{{schema_name}}.{{format_name}}
    type={{type}}
    field_delimiter='{{field_delimiter}}'
    skip_header={{skip_header}};
    {% endset %}
    {% do run_query(create_ffobject) %}
{% endmacro %}

---dbt run-operation file_format_object_mco --args "{'database_name':'dbt_helhos_db','schema_name':'dbt_helhos_sc','format_name':'dbt_helhos_csv_format','type':'CSV','field_delimiter':',','skip_header':'1'}"
