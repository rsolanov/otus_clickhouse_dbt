CREATE DATABASE IF NOT EXISTS dwh ENGINE = Atomic;
CREATE DATABASE IF NOT EXISTS src_northwind ENGINE = Atomic;

CREATE TABLE IF NOT EXISTS src_northwind.orders
(
    order_id Int32,
    customer_id String,
    employee_id Int32,
    order_date Date,
    required_date Date,
    shipped_date Date,
    ship_via Int32,
    freight Decimal(19, 4),
    ship_name String,
    ship_address String,
    ship_city String,
    ship_region String,
    ship_postal_code String,
    ship_country String
)
ENGINE = PostgreSQL('host.docker.internal:5432', 'NorthWind', 'orders', 'default', 'default');

CREATE TABLE IF NOT EXISTS src_northwind.order_details
(
    order_id Int32,
    product_id Int32,
    unit_price Decimal(19, 4),
    quantity Int32,
    discount Decimal(19, 4)
)
ENGINE = PostgreSQL('host.docker.internal:5432', 'NorthWind', 'order_details', 'default', 'default');

CREATE TABLE IF NOT EXISTS src_northwind.customers
(
	customer_id String,
	company_name String,
	contact_name String
)
ENGINE = PostgreSQL('host.docker.internal:5432', 'NorthWind', 'customers', 'default', 'default');

CREATE TABLE IF NOT EXISTS src_northwind.products
(
	product_id Int32,
	category_id Int32
)
ENGINE = PostgreSQL('host.docker.internal:5432', 'NorthWind', 'products', 'default', 'default');

CREATE TABLE IF NOT EXISTS src_northwind.categories
(
	category_id Int32,
	category_name String
)
ENGINE = PostgreSQL('host.docker.internal:5432', 'NorthWind', 'categories', 'default', 'default');