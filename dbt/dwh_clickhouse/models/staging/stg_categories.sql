{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='category_id'
    ) }}
SELECT *
FROM {{ source('src_northwind', 'categories') }}