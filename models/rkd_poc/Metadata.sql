{{ config(materialized='table',
        alias ='Meta_JOB_CNF_TBL_INFO') }}
{%- call statement('clnt_vertical_bu_id_query', fetch_result=True) -%}
 
select CLNT_VERTICAL_BU_ID
from {{source('datafeed_shared_schema','META_BU_VERTICAL_CLIENT_INFO')}}
where CLIENT_NAME ='ABS'
 
{%- endcall -%}
{%- set p_clnt_vertical_bu_id = load_result('clnt_vertical_bu_id_query')['data'][0][0] -%}
 
select * from {{source('datafeed_shared_schema','JOB_CNF_TBL_INFO')}}
where CLNT_VERTICAL_BU_ID =  {{p_clnt_vertical_bu_id}}