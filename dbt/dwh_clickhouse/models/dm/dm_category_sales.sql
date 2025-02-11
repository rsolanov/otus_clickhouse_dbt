{{ config (
    materialized='table',
    engine = 'MergeTree',
    order_by ='category_id'
) }}

WITH product_sales AS (
    SELECT
        p.category_id,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_sales
    FROM {{ ref('stg_order_details') }} od
    JOIN {{ ref('stg_products') }} p ON od.product_id = p.product_id
    GROUP BY p.category_id
)
SELECT
    c.category_id,
    c.category_name,
    COALESCE(ps.total_sales, 0) AS total_sales
FROM {{ ref('stg_categories') }} c
LEFT JOIN product_sales ps ON c.category_id = ps.category_id