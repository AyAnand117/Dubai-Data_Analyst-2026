

use olist;

CREATE TABLE olist_combined (
    order_id VARCHAR(50),
    order_item_id INT,
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(5),
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,
    seller_id VARCHAR(50),
    seller_city VARCHAR(100),
    seller_state VARCHAR(5),
    seller_zip_code_prefix INT,
    payment_type VARCHAR(50),
    payment_sequential INT,
    payment_installments INT,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    payment_value DECIMAL(10,2),
    shipping_limit_date DATETIME,
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    day_of_purchase VARCHAR(20),
    month_of_purchase VARCHAR(20),
    year_of_purchase INT,
    month_year_of_purchase VARCHAR(20),
    order_status VARCHAR(50),
    order_unique_id VARCHAR(100)
);

LOAD DATA LOCAL INFILE 'C:/brazilian_retail/brazilian_retail.csv'
INTO TABLE olist_combined
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
 order_id,
 order_item_id,
 customer_id,
 customer_unique_id,
 customer_zip_code_prefix,
 customer_city,
 customer_state,
 product_id,
 product_category_name,
 product_name_lenght,
 product_description_lenght,
 product_photos_qty,
 product_weight_g,
 product_length_cm,
 product_height_cm,
 product_width_cm,
 seller_id,
 seller_city,
 seller_state,
 seller_zip_code_prefix,
 payment_type,
 payment_sequential,
 payment_installments,
 price,
 freight_value,
 payment_value,
 @shipping_limit_date,
 @order_purchase_timestamp,
 @order_approved_at,
 @order_delivered_carrier_date,
 @order_delivered_customer_date,
 @order_estimated_delivery_date,
 day_of_purchase,
 month_of_purchase,
 year_of_purchase,
 month_year_of_purchase,
 order_status,
 order_unique_id
)
SET 
 shipping_limit_date = STR_TO_DATE(@shipping_limit_date, '%d-%m-%Y %H:%i'),
 order_purchase_timestamp = STR_TO_DATE(@order_purchase_timestamp, '%d-%m-%Y %H:%i'),
 order_approved_at = STR_TO_DATE(@order_approved_at, '%d-%m-%Y %H:%i'),
 order_delivered_carrier_date = STR_TO_DATE(@order_delivered_carrier_date, '%d-%m-%Y %H:%i'),
 order_delivered_customer_date = STR_TO_DATE(@order_delivered_customer_date, '%d-%m-%Y %H:%i'),
 order_estimated_delivery_date = STR_TO_DATE(@order_estimated_delivery_date, '%d-%m-%Y %H:%i');

-- Checking Data
select count(*) from olist_combined;
select * from olist_combined limit 10;

-- Checking Date fields
select 
order_purchase_timestamp,
order_delivered_customer_date,
shipping_limit_date
from olist_combined
limit 10;

select min(order_purchase_timestamp),
max(order_purchase_timestamp)
from olist_combined;

-- Creating derived columns for deeper analysis
alter table olist_combined
add purchase_year int,
add purchase_month int,
add purchase_day int;

update olist_combined
set
purchase_year = year(order_purchase_timestamp),
purchase_month = month(order_purchase_timestamp),
purchase_day = day(order_purchase_timestamp);

/* set sql_safe_updates = 1; */

--  BUSINESS QUERIES

-- total revenue
select sum(price) as total_revenue
from olist_combined;
-- monthly revenue trend
select
	purchase_year,
    purchase_month,
    sum(price) as revenue
from olist_combined
group by purchase_year, purchase_month
order by purchase_year, purchase_month;
-- revenue by state
select * from olist_combined;
select 
customer_state,
sum(price) as revenue
from olist_combined
group by customer_state
order by revenue desc;
-- top 10 product category
select product_category_name, sum(price) as revenue
from olist_combined
group by product_category_name 
order by revenue desc limit 10;
-- Month over month revenue change
with rev_monthly as (
select purchase_month, sum(price) as revenue
from olist_combined
group by purchase_month
order by purchase_month
)
select purchase_month, revenue,
lag(revenue) over (order by purchase_month) as prev_month_revenue,
round((
(revenue- lag(revenue) over(order by purchase_month) )/ nullif(lag(revenue) over (order by purchase_month),0))*100, 2
) as revenue_chg_pct
from rev_monthly
order by purchase_month;
-- Top 3 products per category
/*
with top3products as (
select product_category_name, sum(price) as revenue,
row_number() over (partition by product_category_name order by revenue desc) as prod_catg_rev
from olist_combined)
select * from top3products
group by product_category_name
having prod_catg_rev <= 3
order by revenue desc
;

wrong X
*/
/* Correct */
with top3products as (
select
product_id, product_category_name, sum(price) as revenue,
row_number() over (partition by product_category_name order by sum(price) desc) as prod_catg_rev
from olist_combined
group by product_id, product_category_name
)
select *
from top3products
where prod_catg_rev <= 3
order by product_category_name, revenue desc;