{{ config(materialized='table') }}

{%- call statement('clnt_vertical_bu_id_query', fetch_result=True) -%}
SELECT CLNT_VERTICAL_BU_ID
FROM {{ source('datafeed_shared_schema', 'META_BU_VERTICAL_CLIENT_INFO') }}
WHERE CLIENT_NAME = 'ABS'
{%- endcall -%}

{%- set p_clnt_vertical_bu_id = load_result('clnt_vertical_bu_id_query')['data'][0][0] -%}

SELECT *
FROM {{ source('datafeed_shared_schema', 'JOB_CNF_TBL_INFO') }}
WHERE CLNT_VERTICAL_BU_ID = {{ p_clnt_vertical_bu_id }} and JOB_LAYER='SRC-BRNZ'