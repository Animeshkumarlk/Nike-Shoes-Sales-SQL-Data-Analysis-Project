# Nike Sales SQL Data Analysis Project

This is a complete, real-world SQL Data Analyst project based on a Nike product sales dataset. The project simulates how data analysts work in e-commerce and retail industries by performing data exploration, data cleaning, and business-focused analysis using SQL and PostgreSQL.

---

# 📌 Project Overview

The objective of this project is to simulate a real business scenario where analysts work with raw sales data to extract insights and support decision-making.

Using SQL, this project covers:-

✅ Database and table creation

✅ Importing CSV datasets into PostgreSQL

✅ Data exploration and validation

✅ Data cleaning and handling NULL values

✅ Calculating discount percentages

✅ Product pricing analysis

✅ Revenue estimation

✅ Product segmentation using CASE statements

✅ Writing business-oriented SQL queries

---

# 📁 Dataset Overview

The dataset contains Nike product sales information including:

* Product names
* Product IDs
* Listing prices
* Sale prices
* Discounts
* Ratings
* Reviews
* Brand details
* Product descriptions

Each row represents a product listing from the Nike sales dataset.

---

# 🧾 Columns Used

| Column Name   | Description                        |
| ------------- | ---------------------------------- |
| sku_id        | Unique identifier for each product |
| product_name  | Name of the product                |
| product_id    | Product identification code        |
| listing_price | Original product price             |
| sale_price    | Discounted selling price           |
| discount      | Discount percentage                |
| brand         | Brand name                         |
| description   | Product description                |
| rating        | Product rating                     |
| reviews       | Number of customer reviews         |

---

# 🔧 Project Workflow

## 1. Database & Table Creation

Created the Nike sales table using SQL:

```sql
CREATE TABLE nike(
    sku_id SERIAL PRIMARY KEY,
    product_name VARCHAR(120),
    product_id VARCHAR(150) NOT NULL,
    listing_price NUMERIC(8,2),
    sale_price NUMERIC(8,2),
    discount INTEGER,
    brand VARCHAR(120),
    description TEXT,
    rating NUMERIC(2,1),
    reviews INTEGER
);
```

---

## 2. Data Import

Imported CSV data into PostgreSQL using the `COPY` command.

Example:

```sql
COPY nike(
    product_name,
    product_id,
    listing_price,
    sale_price,
    discount,
    brand,
    description,
    rating,
    reviews
)
FROM 'C:\\temp\\nike_shoes_sales.csv'
DELIMITER ','
CSV HEADER;
```

Handled:

* CSV formatting issues
* NULL values
* Import errors
* PostgreSQL permission problems

---

# 🔍 Data Exploration

Performed exploratory data analysis (EDA) using SQL:

* Counted total rows in dataset
* Viewed sample product data
* Identified NULL values
* Analyzed pricing distributions
* Explored product ratings and reviews
* Checked duplicate products
* Analyzed discount percentages

Example queries:

* Top discounted products
* High-priced products with low ratings
* Products with missing descriptions
* Average discount analysis

---

# 🧹 Data Cleaning

Performed several cleaning operations:

* Handled NULL values
* Fixed data type issues
* Calculated missing discount percentages
* Validated pricing data
* Removed invalid records where necessary

---

# 📊 Business Insights

Generated business-focused insights using SQL queries:

* Top 10 products with highest discounts
* Products with high sale prices but low ratings
* Estimated product revenue analysis
* Highest average discount by product
* Expensive products with low discounts
* Product grouping into Low, Medium, and Bulk categories

---

# 🛠️ SQL Concepts Used

This project demonstrates practical usage of:

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* CASE
* Aggregate Functions
* ROUND()
* DISTINCT
* NULL Handling
* Aliases
* Mathematical Calculations
* Data Cleaning Techniques

---

# 🛠️ Tools & Technologies

* SQL
* PostgreSQL
* pgAdmin 4

---

# 🚀 How to Use This Project

1. Clone the repository

```bash
git clone <your-repository-link>
```

2. Open PostgreSQL / pgAdmin

3. Create a new database

4. Run the SQL file

5. Import the CSV dataset

6. Execute analysis queries

---

# 📜 License

MIT License — free to use for learning and portfolio purposes.

---

# 👨‍💻 About the Project

This project was created as a hands-on SQL portfolio project to strengthen practical data analytics skills using real-world business scenarios and datasets.

It focuses on developing:

* SQL problem-solving skills
* Business-oriented thinking
* Data cleaning techniques
* Exploratory data analysis workflows
* Real analyst-style query writing

---

# ⭐ Support

If you found this project useful, feel free to:

* Star ⭐ the repository
* Fork the project
* Use it in your learning journey
* Share it with others learning SQL and data analytics
