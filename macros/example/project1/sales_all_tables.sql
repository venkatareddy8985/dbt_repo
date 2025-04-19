{% macro sales_all_tables_mco(database_name,schema_name,table_name8,table_name9,table_name10,table_name11,table_name12,
table_name13) %}
    {% set create_tbl8 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name8}}
    (
    SS_SOLD_DATE_SK integer,
    SS_ITEM_SK integer,
    SS_CUSTOMER_SK integer,
    SS_STORE_SK integer,	
    SS_QUANTITY integer,	
    SS_WHOLESALE_COST decimal(15,2),
    SS_SALES_PRICE decimal(15,2),
    SS_EXT_DISCOUNT_AMT decimal(15,2),
    SS_EXT_SALES_PRICE decimal(15,2),
    SS_EXT_WHOLESALE_COST decimal(15,2),
    SS_NET_PAID decimal(15,2),
    SS_NET_PAID_INC_TAX decimal(15,2),
    SS_NET_PROFIT decimal(15,2)
    );
    {% endset %}
    {% do run_query(create_tbl8) %}

    {% set create_tbl9 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name9}}
    (
    S_STORE_SK integer,
    S_STORE_NAME varchar(50),
    S_NUMBER_EMPLOYEES integer,
    S_MANAGER varchar(100),
    S_HOURS varchar(30),
    S_STREET_NAME varchar(100),
    S_CITY varchar(100),
    S_STATE varchar(100),
    S_ZIP integer,
    S_COUNTRY varchar(100),
    S_TAX_PRECENTAGE decimal(10,2)
    );
    {% endset %}
    {% do run_query(create_tbl9) %}

    {% set create_tbl10 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name10}}
    (
    C_CUSTOMER_SK integer,
    C_CURRENT_ADDR_SK integer,
    C_FIRST_NAME varchar(100),
    C_LAST_NAME varchar(100),
    C_BIRTH_DAY integer,
    C_BIRTH_MONTH integer,
    C_BIRTH_YEAR integer,
    C_BIRTH_COUNTRY varchar(100),
    C_EMAIL_ADDRESS varchar(100)
    );
    {% endset %}
    {% do run_query(create_tbl10) %}
    
    {% set create_tbl11 %}   
    create or replace table {{database_name}}.{{schema_name}}.{{table_name11}}
    (
    CA_ADDRESS_SK integer,
    CA_STREET_NAME varchar(100),
    CA_CITY varchar(100),
    CA_STATE varchar(100),
    CA_ZIP integer,
    CA_COUNTRY varchar(100)
    );
   {% endset %}
   {% do run_query(create_tbl11) %}

    {% set create_tbl12 %}   
    create or replace table {{database_name}}.{{schema_name}}.{{table_name12}}
    (
    D_DATE_SK integer,
    D_DATE date,
    D_YEAR integer,
    D_MOY integer,
    D_DOM integer,
    D_QOY integer
    );
    {% endset %}
    {% do run_query(create_tbl12) %}

    {% set create_tbl13 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name13}}
    (
    I_ITEM_SK integer,
    I_ITEM_DESC varchar(100),
    I_CATEGORY varchar(100)
    );
    {% endset %}
    {% do run_query(create_tbl13) %}

{% endmacro %}  