CREATE TABLE public."STG_Customers"
(
    "CustomerName" character varying,
    "Province" character varying,
    "Region" character varying,
    "CustomerSegment" character varying
);

CREATE TABLE public."STG_Orders"
(
    "RowID" numeric,
    "OrderID" numeric,
    "OrderDate" date,
    "OrderPriority" character varying,
    "OrderQuantity" numeric,
    "Sales" numeric,
    "Discount" numeric,
    "ShipMode" character varying,
    "Profit" numeric,
    "UnitPrice" numeric,
    "ShippingCost" numeric,
    "CustomerName" character varying,
    "ProductName" character varying,
    "ShipDate" date
);

CREATE TABLE public."STG_Products"
(
    "ProductName" character varying,
    "ProductCategory" character varying,
    "ProductSubCategory" character varying,
    "ProductContainer" character varying,
    "ProductBaseMargin" numeric
);

CREATE TABLE public."STG_RegionManagers"
(
    "Region" character varying,
    "Manager" character varying
);

CREATE TABLE public."STG_Returns"
(
    "OrderID" numeric,
    "Status" character varying
);

CREATE TABLE public."DWH_Customers"
(
    "CustomerName" character varying,
    "Province" character varying,
    "Region" character varying,
    "CustomerSegment" character varying
);

CREATE TABLE public."DWH_Orders"
(
    "RowID" numeric,
    "OrderID" numeric,
    "OrderDate" date,
    "OrderPriority" character varying,
    "OrderQuantity" numeric,
    "Sales" numeric,
    "Discount" numeric,
    "ShipMode" character varying,
    "Profit" numeric,
    "UnitPrice" numeric,
    "ShippingCost" numeric,
    "CustomerName" character varying,
    "ProductName" character varying,
    "ShipDate" date
);

CREATE TABLE public."DWH_Products"
(
    "ProductName" character varying,
    "ProductCategory" character varying,
    "ProductSubCategory" character varying,
    "ProductContainer" character varying,
    "ProductBaseMargin" numeric
);

CREATE TABLE public."DWH_RegionManagers"
(
    "Region" character varying,
    "Manager" character varying
);

CREATE TABLE public."DWH_Returns"
(
    "OrderID" numeric,
    "Status" character varying
);

CREATE TABLE public."DM_CustomerRegionalSales"
(
    "CustomerName" character varying,
    "Province" character varying,
    "Region" character varying,
    "CustomerSegment" character varying,
    "OrderID" numeric,
    "OrderDate" date,
    "Sales" numeric
);