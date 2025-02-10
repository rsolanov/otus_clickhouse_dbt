{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='order_date, order_id'
    ) }}
SELECT *
FROM {{ source('src_northwind', 'orders') }}