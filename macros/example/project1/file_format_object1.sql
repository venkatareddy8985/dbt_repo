{% macro sales_file_format_mco(database_name,schema_name,file_format_name,type,field_delimiter,skip_header) %}
    {% set create_file_format %}
    create or replace file format {{database_name}}.{{schema_name}}.{{file_format_name}}
    type={{type}}
    field_delimiter='{{field_delimiter}}'
    skip_header={{skip_header}};
    {% endset %}
    {% do run_query(create_file_format) %}
    
{% endmacro %}