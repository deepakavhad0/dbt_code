--Here we dont required to add configuration details to create it as table or view as in source.yml 
--we already have declared materialized=table so it will create the table as table directly

with customers as (
    select
    id AS customer_id,
    first_name,
    last_name
    from {{ref("customer")}}
),
orders as (
    select 
    id as order_id,
    order_date,
    user_id as customer_id
    from {{ref("orders")}}
),
cust_order as (
    select 
    customer_id,
    min(order_date) as first_order_date,
    max(Order_date) as most_recent_order_date,
    count(order_id) as cnt_order_id
    from orders
    group by 1
),

final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        cust_order.first_order_date,
        cust_order.most_recent_order_date,
        coalesce(cust_order.cnt_order_id, 0) as number_of_orders
    from customers
    left join cust_order using (customer_id)
)
select * from final