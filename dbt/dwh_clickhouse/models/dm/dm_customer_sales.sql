{{ config (
    materialized='table',
    engine = 'MergeTree'
    ) }}

WITH order_totals AS (
    SELECT
        o.customer_id,
        SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_sales
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_order_details') }} od ON o.order_id = od.order_id
    GROUP BY o.customer_id
)
SELECT
    c.customer_id,
    c.company_name,
    COALESCE(ot.total_sales, 0) AS total_sales
FROM {{ source('src_northwind', 'customers') }} c
LEFT JOIN order_totals ot ON c.customer_id = ot.customer_id