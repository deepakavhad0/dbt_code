{{ config(materialized='table',
        aliases ='sessions') }} 
--we can declare this or not no matter as we already declare this property in Source.yml file.

WITH tb1  as(
 select
        id ,
        first_name,
        last_name
     from {{source('datafeed_shared_schema','CUSTOMER_DATA')}})
     select * from tb1