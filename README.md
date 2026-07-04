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

  

2. **Load to Warehouse (DWH)**
   Data is inserted from Staging into the Warehouse layer.



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
ial integrity checks, duplicate detection, NULL validation, and STG-to-DWH reconciliation.
