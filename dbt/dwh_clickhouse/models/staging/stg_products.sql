{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='category_id, product_id'
    ) }}
SELECT *
FROM {{ source('src_northwind', 'products') }}