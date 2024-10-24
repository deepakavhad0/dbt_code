{% macro get_payment_methods() %}

{% set payment_methods_query %}
SELECT * FROM {{ref('job_config')}}
order by 1
{% endset %}

{% set results = run_query(payment_methods_query) %}

{{ log(results, info=True) }}

{{ return([]) }}

{% endmacro %}