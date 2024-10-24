-- macros/execute_jobs.sql

{% macro execute_jobs() %}
{% set iteration_value %}
SELECT * FROM {{ref('job_config')}}
{% endset %}
    {% set results = run_query(iteration_value) %}
    {% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0].values() %}
    {% else %}
    {% set results_list = [] %}
{% endif %}
{{ return(results_list) }}
--{{ return(iteration_value) }}
{% endmacro %}