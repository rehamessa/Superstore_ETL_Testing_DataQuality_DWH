
CREATE OR REPLACE VIEW dp_integrity AS
SELECT 
    'STG_Orders' AS table_name,
    'Sales' AS column_name,
    "Sales"::text AS mismatched_value
FROM public."DWH_Orders"

EXCEPT

SELECT 
    'STG_Orders' AS table_name,
    'Sales' AS column_name,
    a."Sales"::text AS mismatched_value
FROM public."STG_Orders" a
INNER JOIN public."DWH_Orders" b ON a."OrderID" = b."OrderID"
;

SELECT * FROM dp_integrity;