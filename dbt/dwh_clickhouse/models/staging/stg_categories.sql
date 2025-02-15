{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='category_id'
    ) }}
SELECT
    category_id,
    category_name
FROM {{ source('src_northwind', 'categories') }}