# Customer Segmentation Analysis (SQL)

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

A SQL-based customer segmentation project exploring customer demographics, purchasing behaviour, income groups, product preferences, and relationships between key customer variables.

The analysis was completed using **MySQL** on the `customer_segmentation_data` dataset. It demonstrates data validation, aggregation, segmentation, ranking, and correlation analysis.

---

## 📑 Table of Contents

* [📌 Project Overview](#-project-overview)
* [🛠️ Tools and Technologies](#️-tools-and-technologies)
* [📅 Dataset](#-dataset)
* [📊 Interactive Dashboard](#-interactive-dashboard)
* [🔎 Data Quality Checks](#-data-quality-checks)
* [📈 Analysis and Key Findings](#-analysis-and-key-findings)
  * [1. Gender Distribution](#1-gender-distribution)
  * [2. Preferred Product Categories](#2-preferred-product-categories)
  * [3. Average Customer Metrics](#3-average-customer-metrics)
  * [4. Age Group Analysis](#4-age-group-analysis)
  * [5. Highest and Lowest Last-Purchase Amounts](#5-highest-and-lowest-last-purchase-amounts)
  * [6. Purchasing Behaviour by Category](#6-purchasing-behaviour-by-category)
  * [7. Customer Income Segmentation](#7-customer-income-segmentation)
  * [8. Correlation Analysis](#8-correlation-analysis)
* [💡 Business Recommendations](#-business-recommendations)
* [🧠 SQL Skills Demonstrated](#-sql-skills-demonstrated)
* [📂 Repository Structure](#-repository-structure)
* [👤 Author](#-author)

---

## 📌 Project Overview

The aim of this project is to understand the characteristics and purchasing patterns of 1,000 customers and identify insights that could support customer-focused business decisions.

The analysis covers:
* Dataset size and data quality
* Customer gender distribution
* Preferred product categories
* Average customer characteristics
* Customer age groups
* Highest and lowest last-purchase amounts
* Purchasing behaviour by product category
* Customer income groups
* Correlations between selected variables

---

## 🛠️ Tools and Technologies

* **SQL**
* **MySQL**
* **MySQL Workbench**
* **GitHub**

---

## 📅 Dataset

* **Table Name:** `customer_segmentation_data`
* **Dataset Source:** [Customer Segmentation Data for Marketing Analysis – Kaggle](https://www.kaggle.com/)
* **Credit:** Sourced from Kaggle and attributed to its original uploader.

The dataset contains **1,000 customer records** and the following fields:

| Column | Description |
| :--- | :--- |
| `id` | Customer identifier |
| `age` | Customer age |
| `gender` | Customer gender |
| `income` | Customer income |
| `spending_score` | Customer spending score |
| `membership_years` | Number of years as a member |
| `purchase_frequency` | Customer purchase frequency |
| `preferred_category` | Customer's preferred product category |
| `last_purchase_amount` | Amount of the customer's last purchase |

> **Note:** The precise definitions and units of numeric measures should be confirmed from the original dataset documentation where available.

---

## 📊 Interactive Dashboard

Explore the interactive dashboard created to present the customer segmentation findings visually. *(Note: This dashboard was created with the assistance of AI).*

👉 **[View Interactive Dashboard](file:///Users/jiwangurung/Downloads/Customer%20Segmentation%20Dashboard.html)**

---

## 🔎 Data Quality Checks

Before analysing the data, SQL queries were executed to verify the structure and quality of the dataset.

| Check | Result |
| :--- | :--- |
| Total customer records | 1,000 |
| Duplicate customer IDs | 0 |
| Exact duplicate records | 0 |
| Missing values | 0 |

**Finding:** The checks identified no duplicate IDs, exact duplicate records, or missing values in the columns examined.

---

## 📈 Analysis and Key Findings

### 1. Gender Distribution

| Gender | Customers | Percentage |
| :--- | :---: | :---: |
| **Male** | 357 | 35.70% |
| **Other** | 327 | 32.70% |
| **Female** | 316 | 31.60% |

* **Insight:** The customer base is relatively balanced across the three gender categories, with Male customers representing the largest group.

---

### 2. Preferred Product Categories

| Category | Customers | Percentage |
| :--- | :---: | :---: |
| **Electronics** | 215 | 21.50% |
| **Sports** | 210 | 21.00% |
| **Home & Garden** | 206 | 20.60% |
| **Groceries** | 199 | 19.90% |
| **Clothing** | 170 | 17.00% |

* **Insight:** Electronics is the most popular preferred category, while Clothing has the lowest customer count.

---

### 3. Average Customer Metrics

| Metric | Average |
| :--- | :---: |
| **Age** | 43.78 years |
| **Income** | $88,500.80 |
| **Spending score** | 50.69 |
| **Membership duration** | 5.47 years |
| **Purchase frequency** | 26.60 |
| **Last purchase amount** | $492.35 |

---

### 4. Age Group Analysis

| Finding | Result |
| :--- | :--- |
| **Largest age group** | 45–54 (218 customers) |
| **Second-largest age group** | 55–64 (205 customers) |
| **Third-largest age group** | 25–34 (199 customers) |
| **Highest average income** | 18–24 ($91,287.46) |
| **Highest average spending score** | 35–44 (55.84) |

* **Insight:** Customers aged 45–54 form the largest age group. However, the youngest age group (18–24) has the highest average income, while customers aged 35–44 have the highest average spending score.

---

### 5. Highest and Lowest Last-Purchase Amounts

* **Top Purchases:** The 10 highest last-purchase amounts range from **990.87 to 999.74**.
  * Customer `267` recorded the highest amount: **999.74**.
  * Customer `381` is second: **998.98**.
* **Lowest Purchases:** The 10 lowest last-purchase amounts range from **10.40 to 15.04**.
  * Customer `486` recorded the lowest amount: **10.40**.
  * Customer `881` is second-lowest: **11.01**.

---

### 6. Purchasing Behaviour by Category

| Finding | Result |
| :--- | :--- |
| **Highest average purchase amount** | Home & Garden ($505.60) |
| **Second-highest average purchase amount** | Electronics ($496.63) |
| **Lowest average purchase amount** | Sports ($481.95) |
| **Highest average purchase frequency** | Groceries (27.16) |

* **Insight:** Home & Garden has the highest average last-purchase amount, while Groceries has the highest average purchase frequency.

---

### 7. Customer Income Segmentation

Income groups were defined using the following thresholds:
* **Low income:** Below $60,000
* **Medium income:** $60,000–$100,000
* **High income:** Above $100,000

| Income Group | Customers |
| :--- | :---: |
| **High income** | 400 |
| **Medium income** | 330 |
| **Low income** | 270 |

* The medium-income group has the highest average spending score at **51.37**. Average spending scores are relatively consistent across all three groups.
* **Insight:** Income group alone does not appear to strongly distinguish spending score behavior in this dataset.

---

### 8. Correlation Analysis

| Variables | Correlation |
| :--- | :---: |
| **Age and Income** | -0.001 |
| **Income and Spending Score** | 0.000 |
| **Purchase Frequency and Spending Score** | 0.007 |

* **Insight:** The calculated correlations are very close to zero, indicating almost no linear relationship between these variable pairs. Note that correlation does not establish causation and does not rule out potential non-linear relationships.

---

## 💡 Business Recommendations

Based on the findings, areas for strategic exploration include:

1. **Review Category Performance:** Investigate why Home & Garden generates the highest average purchase amount and whether cross-selling opportunities exist.
2. **Explore Customer Preferences:** Examine drivers behind Electronics being the most frequently chosen category.
3. **Investigate Purchase Frequency:** Explore what drives high purchase frequency within the Groceries category.
4. **Develop Behavioural Segments:** Combine age, category preference, membership duration, purchase frequency, and spending score into composite behavioral segments rather than relying solely on income.
5. **Explore Customer Engagement:** Investigate whether membership duration correlates with repeat purchasing behavior or total customer lifetime value.

---

## 🧠 SQL Skills Demonstrated

This project showcases practical proficiency in:

* `SELECT`, `FROM`, `WHERE`, `HAVING`
* Aggregations: `COUNT()`, `SUM()`, `AVG()`
* Formatting & String Manipulation: `ROUND()`, `CONCAT()`
* Grouping & Ordering: `GROUP BY`, `ORDER BY`
* Conditional Logic: `CASE WHEN`
* Advanced SQL: Subqueries & Window Functions
* Data Filtering: `LIMIT`
* Data Quality Validation: Missing-value and duplicate record checks
* Statistical Analysis: Standard deviation and correlation calculations

---

## 📂 Repository Structure

```text
customer-segmentation-analysis/
│
├── README.md
├── customer_segmentation_analysis.sql
├── customer_segmentation_data.csv
└── Customer Segmentation Dashboard.html
```

---
## 👤 Author

**Jiwan Gurung**
* **LinkedIn:** [Jiwan Gurung](https://www.linkedin.com/in/jiwan-gurung-792088124/) # CustomerMarketingAnalysisSQL
