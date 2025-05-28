use DB_CHURN
select * from Customer


SELECT GENDER ,COUNT(GENDER) AS TOTAL_COUNT ,
ROUND(COUNT(GENDER)*1.0 /(SELECT COUNT( *) FROM CUSTOMER)*100 ,2)AS PERCENTAGE
FROM CUSTOMER
GROUP BY GENDER

SELECT contract  ,COUNT(contract) AS TOTAL_COUNT ,
ROUND(COUNT(contract)*1.0 /(SELECT COUNT(*) FROM CUSTOMER)*100 ,2)AS PERCENTAGE
FROM CUSTOMER
GROUP BY contract

SELECT customer_status,COUNT(customer_status) AS TOTAL_COUNT ,
ROUND(COUNT(customer_status)*1.0 /(SELECT COUNT( *) FROM CUSTOMER)*100 ,2)AS PERCENTAGE
FROM CUSTOMER
GROUP BY customer_status

select * from customer

SELECT state ,COUNT(state) AS TOTAL_COUNT ,
ROUND(COUNT(state)*1.0 /(SELECT COUNT( *) FROM CUSTOMER)*100 ,2)AS PERCENTAGE
FROM CUSTOMER
GROUP BY state order by percentage desc

SELECT ,COUNT(state) AS TOTAL_COUNT ,
ROUND(COUNT(state)*1.0 /(SELECT COUNT( *) FROM CUSTOMER)*100 ,2)AS PERCENTAGE
FROM CUSTOMER
GROUP BY state order by percentage desc

SELECT
  SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
  SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
  SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
  SUM(CASE WHEN married IS NULL THEN 1 ELSE 0 END) AS married_nulls,
  SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS state_nulls,
  SUM(CASE WHEN number_of_referrals IS NULL THEN 1 ELSE 0 END) AS refferal_nulls,
  SUM(CASE WHEN tenure_in_months IS NULL THEN 1 ELSE 0 END) AS tenure_nulls,
  SUM(CASE WHEN value_deal IS NULL THEN 1 ELSE 0 END) AS val_nulls,
  SUM(CASE WHEN phone_service IS NULL THEN 1 ELSE 0 END) AS ph_service_nulls,
  SUM(CASE WHEN multiple_lines  IS NULL THEN 1 ELSE 0 END) AS mul_line_nulls,
  SUM(CASE WHEN internet_service IS NULL THEN 1 ELSE 0 END) AS inetrnet_nulls,
  SUM(CASE WHEN internet_type IS NULL THEN 1 ELSE 0 END) AS int_type_id_nulls,
  SUM(CASE WHEN online_security IS NULL THEN 1 ELSE 0 END) AS security_nulls,
  SUM(CASE WHEN online_backup IS NULL THEN 1 ELSE 0 END) AS backup_nulls,
  SUM(CASE WHEN device_protection_plan IS NULL THEN 1 ELSE 0 END) AS protection_nulls,
  SUM(CASE WHEN premium_support IS NULL THEN 1 ELSE 0 END) AS premium_nulls,
  SUM(CASE WHEN streaming_tv IS NULL THEN 1 ELSE 0 END) AS tv_nulls,
  SUM(CASE WHEN streaming_movies IS NULL THEN 1 ELSE 0 END) AS movies_nulls,
  SUM(CASE WHEN streaming_music IS NULL THEN 1 ELSE 0 END) AS music_nulls,
  SUM(CASE WHEN unlimited_data IS NULL THEN 1 ELSE 0 END) AS data_nulls,
  SUM(CASE WHEN contract IS NULL THEN 1 ELSE 0 END) AS contract_nulls,
  SUM(CASE WHEN paperless_billing IS NULL THEN 1 ELSE 0 END) AS billing_nulls,
  SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS pay_nulls,
  SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS month_charge_nulls,
  SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS charges_nulls,
  SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS refunds_nulls,
  SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS tedc_nulls,
  SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS tldc_nulls,
  SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS revenue_nulls,
  SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS customer_status_nulls,
  SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS ch_category_nulls,
  SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS ch_reason_nulls
  
FROM customer;


update customer set 
value_deal=replace(value_deal,'null','none'),
multiple_lines=replace(multiple_lines,'null','none'),
internet_type=replace(Internet_Type,'null','none'),
online_security=replace(Online_Security,'null','none'),
online_backup=replace(Online_Backup,'null','none'),
device_protection_plan=replace(Device_Protection_Plan,'null','none'),
Premium_Support=replace(Premium_Support,'null','none'),
Streaming_TV=replace(Streaming_TV,'null','none'),
Streaming_Movies=replace(Streaming_Movies,'null','none'),
Streaming_Music=replace(Streaming_Music,'null','none'),
Unlimited_Data=replace(Unlimited_Data,'null','none'),
Churn_Category=replace(Churn_Category,'null','none'),
Churn_Reason=replace(Churn_Reason,'null','none')



SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    ISNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    ISNULL(Multiple_Lines, 'No') As Multiple_Lines,
    Internet_Service,
    ISNULL(Internet_Type, 'None') AS Internet_Type,
    ISNULL(Online_Security, 'No') AS Online_Security,
    ISNULL(Online_Backup, 'No') AS Online_Backup,
    ISNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    ISNULL(Premium_Support, 'No') AS Premium_Support,
    ISNULL(Streaming_TV, 'No') AS Streaming_TV,
    ISNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    ISNULL(Streaming_Music, 'No') AS Streaming_Music,
    ISNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    ISNULL(Churn_Category, 'Others') AS Churn_Category,
    ISNULL(Churn_Reason , 'Others') AS Churn_Reason

INTO [db_Churn].[dbo].[customer2]
FROM [db_Churn].[dbo].[customer];


select * from customer2

Create View vw_ChurnData as
	select * from customer where Customer_Status In ('Churned', 'Stayed')


Create View vw_JoinData as
	select * from customer where Customer_Status = 'Joined'

select * from vw_ChurnData
