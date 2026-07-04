CREATE OR REPLACE VIEW dp_consistency AS (
SELECT 
	'STG_Orders' AS Table,
	'OrderPriority' AS Column,
	"OrderPriority" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Orders"
GROUP BY "OrderPriority"

UNION ALL

SELECT 
	'STG_Orders' AS Table,
	'ShipMode' AS Column,
	"ShipMode" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Orders"
GROUP BY "ShipMode"
	
UNION ALL

SELECT 
	'STG_Returns' AS Table,
	'Status' AS Column,
	"Status" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Returns"
GROUP BY "Status"

UNION ALL

SELECT 
	'STG_Customers' AS Table,
	'CustomerSegment' AS Column,
	"CustomerSegment" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Customers"
GROUP BY "CustomerSegment"

UNION ALL

SELECT 
	'STG_Customers' AS Table,
	'Province' AS Column,
	"Province" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Customers"
GROUP BY "Province"

UNION ALL

SELECT 
	'STG_Customers' AS Table,
	'Region' AS Column,
	"Region" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Customers"
GROUP BY "Region"

UNION ALL

SELECT 
	'STG_RegionManagers' AS Table,
	'Region' AS Column,
	"Region" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_RegionManagers"
GROUP BY "Region"

UNION ALL

SELECT 
	'STG_Products' AS Table,
	'ProductCategory' AS Column,
	"ProductCategory" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Products"
GROUP BY "ProductCategory"

UNION ALL

SELECT 
	'STG_Products' AS Table,
	'ProductSubCategory' AS Column,
	"ProductSubCategory" AS distinct_value,
	COUNT(*) AS number_records
FROM Public."STG_Products"
GROUP BY "ProductSubCategory"
)

SELECT * FROM PuBLIC.dp_consistency