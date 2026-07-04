# Superstore_ETL_Testing_DataQuality_DWH


An end-to-end ETL and Data Quality testing project built on PostgreSQL, simulating a real-world Data Warehouse pipeline using the classic Superstore dataset. The project follows a three-layer architecture (Staging → Data Warehouse → Data Mart) and includes a full suite of Data Quality (DQ) checks commonly used in ETL/DWH testing roles.

## 🏗️ Architecture

The project is structured across three layers:

| Layer | Prefix | Purpose |
|-------|--------|---------|
| **Staging** | `STG_` | Raw data loaded directly from source CSV files, no transformation |
| **Data Warehouse** | `DWH_` | Cleaned, validated data loaded from Staging |
| **Data Mart** | `DM_` | Business-ready, denormalized data for reporting/analytics |

## 📊 Tables

- **Customers** — Customer name, province, region, segment
- **Orders** — Order details including sales, profit, discount, shipping info
- **Products** — Product name, category, sub-category, base margin
- **RegionManagers** — Mapping of regions to managers
- **Returns** — Order return status

Data Mart output: `DM_CustomerRegionalSales` — a combined view of customer and order data for regional sales analysis.

## 🔄 ETL Process

1. **Extract & Load (STG)**
   Source CSVs are loaded into staging tables using `COPY`, with encoding handled explicitly (`WIN1252`) to resolve source files exported from Windows/Excel environments.

   ```sql
   COPY public."STG_Orders" FROM 'path/to/Orders.csv'
   DELIMITER ';' CSV HEADER ENCODING 'WIN1252';
   ```

2. **Load to Warehouse (DWH)**
   Data is inserted from Staging into the Warehouse layer.

   ```sql
   INSERT INTO public."DWH_Orders"
   SELECT * FROM public."STG_Orders";
   ```

3. **Data Mart Build**
   Warehouse data is joined and denormalized into `DM_CustomerRegionalSales` for reporting.

## ✅ Data Quality Checks

A set of SQL views was built to validate data at each stage of the pipeline, covering the core dimensions of data quality:

| Check | View | Description |
|-------|------|-------------|
| **Completeness** | `dp_completeness` | Counts NULLs per critical column across all tables |
| **Uniqueness** | `dp_uniqueness` | Detects duplicate records (e.g. duplicate `OrderID`) |
| **Validity** | `dp_validity` | Validates business rules (e.g. `RowID` must be > 0) |
| **Consistency** | `dp_consistency` | Surfaces distinct values per column to catch inconsistent formatting (e.g. "High" vs "high") |
| **Integrity** | `dp_integrity` | Compares values between STG and DWH to catch data lost or altered during load |

### Example — Completeness Check
```sql
SELECT
    'STG_Customers' AS table_name,
    'CustomerName' AS attribute,
    SUM(CASE WHEN "CustomerName" IS NULL THEN 1 ELSE 0 END) AS count_nulls
FROM public."STG_Customers";
```

### Example — Integrity Check
```sql
SELECT 'STG_Orders' AS table_name, 'Sales' AS column_name, "Sales"::text AS mismatched_value
FROM public."DWH_Orders"
EXCEPT
SELECT 'STG_Orders', 'Sales', a."Sales"::text
FROM public."STG_Orders" a
INNER JOIN public."DWH_Orders" b ON a."OrderID" = b."OrderID";
```

## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Loading:** SQL `COPY` / `\copy`
- **Validation:** SQL Views (Completeness, Uniqueness, Validity, Consistency, Integrity)

## 📁 Project Structure

```
├── sql/
│   ├── 01_create_tables.sql        -- STG, DWH, DM table definitions
│   ├── 02_load_staging.sql         -- COPY statements for source CSVs
│   ├── 03_load_dwh.sql             -- INSERT INTO DWH from STG
│   ├── 04_dq_completeness.sql
│   ├── 05_dq_uniqueness.sql
│   ├── 06_dq_validity.sql
│   ├── 07_dq_consistency.sql
│   └── 08_dq_integrity.sql
├── data/
│   └── (source CSV files — not included, see below)
└── README.md
```

## ⚠️ Notes

- Source CSV files are not included in this repo. Update file paths in `02_load_staging.sql` to match your local environment.
- Source files were encoded in `WIN1252`; adjust the `ENCODING` clause if your files differ.
- Table and column names are case-sensitive (quoted identifiers) — always reference them exactly as defined in `01_create_tables.sql`.

## 📌 Purpose

This project was built as hands-on practice for ETL/DWH Testing and Data Quality Analyst roles, covering core skills such as row count validation, referential integrity checks, duplicate detection, NULL validation, and STG-to-DWH reconciliation.
