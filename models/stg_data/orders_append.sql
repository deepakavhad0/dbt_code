{{ config 
    (materialized= "incremental",
    incremental_strategy="append")}} --As it is append only so it will allow the duplicate records.
    -- If any records will get updated in source then also it wont allow to replace that original value 
    -- with the new value.

select * from {{source("datafeed_shared_schema","ORDERS_DATA")}} --where id in(97,98,99)