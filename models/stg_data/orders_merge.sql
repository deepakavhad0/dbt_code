{{ config 
    (materialized="incremental",
    unique_key_id= "id", 
    incremental_strategy="merge")
}} -- As this is the merge operation so we are passing the unique key id for the reference purpose

select * from {{source ("datafeed_shared_schema","ORDERS_DATA")}} --where id in (96,97,98,99)