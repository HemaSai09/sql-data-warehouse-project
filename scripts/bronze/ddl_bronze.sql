/*
==================================================================
DDL Script: Create Bronze Layers
==================================================================
*/

if object_id('bronze.crm_cust_info' , 'U') IS NOT NULL
	drop table bronze.crm_cust_info;
create table bronze.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_martial_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date date
);

if object_id('bronze.crm_prd_info' , 'U') IS NOT NULL
	drop table bronze.crm_prd_info;
create table bronze.crm_prd_info(
	prd_id int,
	prd_key nvarchar(50),
	prd_nm nvarchar(50),
	prd_cost int,
	prd_line nvarchar(50),
	prd_start_dt Datetime,
	prd_end_dt Datetime
);

if object_id('bronze.crm_sales_details' , 'U') IS NOT NULL
	drop table bronze.crm_sales_details;
create table bronze.crm_sales_details(
	sls_ord_num nvarchar(30),
	sls_prd_key nvarchar(50),
	sls_cust_id int,
	sls_order_dt int,
	sls_ship_dt int,
	sls_due_dt int,
	sls_sales_dt int,
	sls_quantity int,
	sls_price int
);

if object_id('bronze.erp_loc_a101' , 'U') IS NOT NULL
	drop table bronze.erp_loc_a101;
create table bronze.erp_loc_a101 (
	cid nvarchar(50),
	cntry nvarchar(50)
);

if object_id('bronze.erp_cust_az12' , 'U') IS NOT NULL
	drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12 (
	cid nvarchar(50),
	bdate date,
	gen nvarchar(50)

);

if object_id('bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL
	drop table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2(
	id nvarchar(50),
	cat nvarchar(50),
	subcat nvarchar(50),
	maintenance nvarchar(50)
);


select * from bronze.crm_cust_info;
