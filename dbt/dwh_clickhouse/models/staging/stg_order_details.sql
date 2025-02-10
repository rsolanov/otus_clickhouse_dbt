{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='order_id'
    ) }}
SELECT *
FROM {{ source('src_northwind', 'order_details') }}