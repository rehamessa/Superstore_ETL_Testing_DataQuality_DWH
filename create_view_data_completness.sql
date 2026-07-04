CREATE OR REPLACE view dp_completness AS (
	SELECT 
'STG_Customers' AS TABLE,
'CustomerName' AS Attribute,
SUM(CASE WHEN "CustomerName" IS NULL THEN 1 ELSE 0 END) AS count_nulls_names
FROM PUBLIC."STG_Customers"
	
UNION ALL

	SELECT 
'STG_Customers' AS TABLE,
'Province' AS Attribute,
SUM(CASE WHEN "Province" IS NULL THEN 1 ELSE 0 END) AS count_nulls_Province
FROM PUBLIC."STG_Customers"

UNION ALL

	SELECT 
'STG_Customers' AS TABLE,
'Region' AS Attribute,
SUM(CASE WHEN "Region" IS NULL THEN 1 ELSE 0 END) AS count_nulls_Region
FROM PUBLIC."STG_Customers"

UNION ALL

	SELECT 
'STG_Customers' AS TABLE,
'CustomerSegment' AS Attribute,
SUM(CASE WHEN "CustomerSegment" IS NULL THEN 1 ELSE 0 END) AS count_nulls_CustomerSegment
FROM PUBLIC."STG_Customers"

UNION ALL

	SELECT 
'STG_Orders' AS TABLE,
'OrderID' AS Attribute,
SUM(CASE WHEN "OrderID" IS NULL THEN 1 ELSE 0 END) AS count_nulls_OrderID
FROM PUBLIC."STG_Orders"

UNION ALL

	SELECT 
'STG_Orders' AS TABLE,
'OrderDate' AS Attribute,
SUM(CASE WHEN "OrderDate" IS NULL THEN 1 ELSE 0 END) AS count_nulls_OrderDate
FROM PUBLIC."STG_Orders"

UNION ALL

	SELECT 
'STG_Orders' AS TABLE,
'OrderDate' AS Attribute,
SUM(CASE WHEN "OrderDate" IS NULL THEN 1 ELSE 0 END) AS count_nulls_OrderDate
FROM PUBLIC."STG_Orders"


)

SELECT * FROM PUBLIC.dp_completness