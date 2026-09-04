# 📊 Sales Performance Dashboard — Power BI

A complete interactive **Sales Performance Dashboard** built using **Microsoft Power BI** to analyze sales, transactions, products, customers, payment methods, customer segments, and revenue trends.

The project uses a **star-schema data model** with fact and dimension tables and includes interactive slicers, DAX measures, bookmarks, navigation buttons, and multiple analytical dashboard pages.

---

## 🖥️ Dashboard Preview

### Sales Performance Dashboard
The main dashboard provides an overall view of business performance.

Key metrics include:

- Total Sales
- Total Transactions
- Units Sold
- Average Transaction Value
- Total Customers
- Selected Category Sales

Visualizations include:

- Sales by Category
- Monthly Revenue Trend
- Top 10 Products by Sales
- Sales by Payment Method
- Sales by Customer Segment
- Product Category slicer
- Transaction Method slicer
- Reset Filters button
- Customer Analysis navigation button

---

## 📌 Project Overview

This project was created to demonstrate practical skills in:

- Data Modeling
- Power BI
- DAX
- Data Analysis
- Dashboard Design
- Interactive Slicers
- Bookmarks
- Page Navigation
- KPI Cards
- Business Intelligence

The dashboard allows users to interact with the data and dynamically analyze sales performance across different categories, customers, states, payment methods, and customer segments.

---

# 🗂️ Dashboard Pages

## 1️⃣ Sales Performance Dashboard

The main sales overview page contains:

### KPI Cards

- Total Sales
- Total Transactions
- Units Sold
- Average Transaction Value
- Total Customers
- Selected Category Sales

### Charts

- Sales by Category
- Monthly Revenue Trend
- Top 10 Products by Sales
- Sales by Payment Method
- Total Sales by Customer Segment

### Filters

- Product Category
- Transaction Method

### Interactive Features

- Reset Filters button
- Customer Analysis navigation button
- Bookmark-based filter reset
- Interactive slicers

---

## 2️⃣ Customer Analysis

The Customer Analysis page focuses on customer-level performance.

### KPI Cards

- Total Customers
- Average Sales per Customer

### Visualizations

- Customer Sales Details
- Sales by State
- Sales by Customer Segment
- Average Sales per Customer Segment
- Top 10 Customers

### Filters

- Customer Segment
- State

This page helps identify high-value customers, important regions, and customer segment performance.

---

## 3️⃣ Customer Details

The Customer Details page provides transaction-level information for selected customers.

### KPI Cards

- Total Sales
- Total Transactions
- Total Quantity

### Customer Transaction Table

The table contains:

- Customer Name
- Customer Segment
- State
- Total Sales
- Payment Method

The page allows users to drill into detailed customer transactions and understand individual customer activity.

---

# 🧩 Data Model

The project follows a **Star Schema** data model.

### Fact Table

`project2_fact_sales`

Contains transactional sales information such as:

- Sales ID
- Customer ID
- Product ID
- Date ID
- Sales Amount
- Quantity
- Payment Method

### Dimension Tables

`project2_dim_customer`

Contains customer information such as:

- Customer ID
- Customer Name
- Customer Segment
- State

`project2_dim_product`

Contains product information such as:

- Product ID
- Product Name
- Category

`project2_dim_date`

Contains date-related information used for time-based analysis.

---

# 🔗 Data Relationships

The model connects the fact table with the dimension tables using keys.

```text
                 ┌─────────────────────┐
                 │   dim_customer      │
                 │                     │
                 │ customer_id         │
                 │ customer_name       │
                 │ customer_segment    │
                 │ state               │
                 └──────────┬──────────┘
                            │
                            │
                 ┌──────────▼──────────┐
                 │                     │
                 │    fact_sales       │
                 │                     │
                 │ sales_id            │
                 │ customer_id         │
                 │ product_id          │
                 │ date_id             │
                 │ sales_amount        │
                 │ quantity            │
                 │ payment_method      │
                 │                     │
                 └──────┬───────┬──────┘
                        │       │
              ┌─────────┘       └─────────┐
              │                           │
     ┌────────▼─────────┐       ┌─────────▼─────────┐
     │   dim_product    │       │     dim_date      │
     │                  │       │                   │
     │ product_id       │       │ date_id           │
     │ product_name     │       │ date              │
     │ category         │       │ month             │
     └──────────────────┘       │ year              │
                                └───────────────────┘
