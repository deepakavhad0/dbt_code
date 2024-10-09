{{ config(materialized='view') }}

-- here we have to create the target as view so we have explicitly 
--decalre the materialized property as View


WITH tb1  as(
 select
        id,
        order_date,
        user_id,
        status
     from {{source('datafeed_shared_schema','ORDERS_DATA')}})
     select * from tb1
