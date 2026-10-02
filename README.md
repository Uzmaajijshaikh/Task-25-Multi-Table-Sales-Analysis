Data Analytics Internship – Task 25 (Multi-Table Sales Analysis)

This repository contains my submission for Task 25 of the Data Analytics Internship.

Dataset - Olist Brazilian E-Commerce Dataset

Objective - The objective was to combine orders, customers, products, and order-item data for multi-table sales analysis and create a business dashboard.

Tools Used
1. DB Browser for SQLite
2. Power BI
3. GitHub

Multi-Table Sales Analysis
1. Imported the Olist customers, orders, order items, and products tables.
2. Validated the relationships between the tables before performing the analysis.
3. Used SQL joins to combine customer, order, order-item, and product information.
4. Checked for orders without matching order-item records to avoid incorrect sales calculations.
5. Calculated total orders, customers, products, sales by state, and sales by product category.
6. Analyzed monthly sales trends and order status distribution.
7. Identified the top 10 products and top customers based on sales.
8. Created a Power BI dashboard containing KPIs, charts, and sales analysis.
9. Added five business insights based on the analysis.

Key Results
1. Total Orders - 99,441
2. Total Sales - Approximately 13.59 million
3. Total Unique Customers - Approximately 96,096
4. Orders without item records - 775
5. Delivered orders represent the majority of orders.

Files
1. Task 25.pbix - Power BI dashboard and data model
2. Task 25.sql - SQL queries used for the analysis
3. Output 1.PNG to Output 2.PNG - SQL query outputs
4. README.md - Summary of the multi-table sales analysis

Conclusion
The Olist dataset was successfully analyzed by combining multiple related tables using SQL and Power BI. The analysis covered sales, customers, products, order status, and monthly trends while validating joins to reduce the risk of double counting. The final Power BI dashboard presents the main results and five business insights.
