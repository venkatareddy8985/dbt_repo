{% macro sns_gmail_alerts_notification_mco(notification_integration_name) %}
{% set create_notifi_integra %}
---use database {{database_name}};
---use schema {{schema_name}};
create or replace notification integration {{notification_integration_name}}
enabled=true
type=queue
notification_provider=aws_sns
direction=outbound
aws_sns_topic_arn='arn:aws:sns:eu-north-1:743938722121:dbt_healthcare_gmail_alerts_noti'
aws_sns_role_arn='arn:aws:iam::743938722121:role/dbt_healthcare_fulldata_role';
{% endset %}
{% do run_query(create_notifi_integra) %}
{% endmacro %}

---dbt run-operation sns_gmail_alerts_notification_mco --args "{'notification_integration_name':'dbt_error_notification_integration'}"