COPY public."STG_Customers" FROM 'C:\Users\Khalid.G\Downloads\Source_data\Customers.csv' DELIMITER ';' CSV HEADER;

COPY public."STG_Orders" FROM 'C:\Users\Khalid.G\Downloads\Source_data\Orders.csv' 
DELIMITER ';' CSV HEADER ENCODING 'WIN1252';

COPY public."STG_Products" FROM 'C:\Users\Khalid.G\Downloads\Source_data\Products.csv' DELIMITER ';' CSV HEADER;

COPY public."STG_RegionManagers" FROM 'C:\Users\Khalid.G\Downloads\Source_data\RegionManagers.csv' DELIMITER ';' CSV HEADER;

COPY public."STG_Returns" FROM 'C:\Users\Khalid.G\Downloads\Source_data\Returns.csv' DELIMITER ';' CSV HEADER;