{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='customer_id'
    ) }}
SELECT *
FROM {{ source('src_northwind', 'customers') }}