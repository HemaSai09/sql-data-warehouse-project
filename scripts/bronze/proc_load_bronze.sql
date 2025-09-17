/*
=====================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=====================================================================================
Script Purpose:
        This Stored Procedure load data into the bronze schema from external csv files.
        It performs the following actions:
        - Truncates the bronze tables before loading the data
        - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.
*/

create or alter PROCEDURE bronze.load_bronze as
BEGIN
	declare @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		set @batch_start_time = GETDATE();
		print '====================================';
		print 'Loading Bronze Layer';
		print '=====================================';

		set @start_time = GETDATE();
		print '--------------------------------------';
		print 'Loading CRM Tables';
		print '--------------------------------------';

		print '>> Truncating Table: bronze.crm_cust_info';
		Truncate table bronze.crm_cust_info

		print '>> Inserting Data Into: bronze.crm_cust_info';
		BULK insert bronze.crm_cust_info
		from 'D:\SQLWork\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();

		print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		print '----------------------- X ----------------------'

		print '>> Truncating Table: bronze.crm_prd_info';
		Truncate table bronze.crm_prd_info

		print '>> Inserting Data Into: bronze.crm_prd_info';
		BULK insert bronze.crm_prd_info
		from 'D:\SQLWork\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();

		print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		print '----------------------- X ----------------------'

		print '>> Truncating Table: bronze.crm_sales_details';
		Truncate table bronze.crm_sales_details

		print '>> Inserting Data Into: bronze.crm_sales_details';
		BULK insert bronze.crm_sales_details
		from 'D:\SQLWork\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = GETDATE();

		print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		print '----------------------- X ----------------------'

		set @end_time = GETDATE();
		print '>> Truncating Table: bronze.erp_loc_a101';
		Truncate table bronze.erp_loc_a101

		print '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK insert bronze.erp_loc_a101
		from 'D:\SQLWork\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = GETDATE();

		print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		print '----------------------- X ----------------------'

		set @end_time = GETDATE();
		print '>> Truncating Table: bronze.erp_cust_az12';
		Truncate table bronze.erp_cust_az12

		print '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK insert bronze.erp_cust_az12
		from 'D:\SQLWork\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = GETDATE();

		print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		print '----------------------- X ----------------------'

		set @end_time = GETDATE();
		print '>> Truncating Table: bronze.erp_px_cat_g1v2';
		Truncate table bronze.erp_px_cat_g1v2

		set @end_time = GETDATE();
		print '>> Truncating Table: bronze.erp_px_cat_g1v2';
		BULK insert bronze.erp_px_cat_g1v2
		from 'D:\SQLWork\sql-data-warehouse-project\datasets\source_erp\px_cat_glv2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();

		print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		print '----------------------- X ----------------------'

		set @batch_end_time = GETDATE();
		print '======================================';
		print 'Loading Bronze Layer is Completed'
		print '>> Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
		print '-----------------------------------------------'
	END TRY
	BEGIN CATCH
		print '=======================================================';
		print ' Error Occured During Loading Bronze Layer';
		print 'Error Message' + Error_Message();
		print ' Erroe Message' + CAST(Error_Number() AS NVARCHAR);
		print ' Erroe Message' + CAST(Error_State() AS NVARCHAR);
		print '========================================================';
	END CATCH
END
 

exec bronze.load_bronze;
