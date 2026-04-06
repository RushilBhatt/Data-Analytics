# Retail Data Analytics Dashboard: 2017 Performance Audit

## 🎯 Business Context
A Superstore operating across multiple regions is facing increasing competition and margin pressure. Management requires data-backed insights to transition from high-volume growth to **profitable growth**. 

The core objectives of this analysis are to:
* **Identify High-Performing Products:** Determine which items drive the most value.
* **Identify Loss-Making Categories:** Pinpoint where the business is bleeding margin.
* **Understand Regional Differences:** Compare performance across the South, East, West, and Central regions.
* **Analyze Customer Segment Profitability:** Evaluate the impact of specific segments and individual outliers.
* **Improve Discount Strategy:** Find the "break-even" threshold for discounting.
* **Optimize Product Targeting:** Recommend where to double down and where to cut back.

---

## Dataset
- 'Sample - Superstore.csv': Contains customer demographics, product hierarchies, and geographic data alongside core financial metrics: Sales, Quantity, Discount, and Profit.

---

## Approach
- Data Exploration & Cleaning: Used Python (Pandas) to check null values per column, duplicate values, outlier analysis.
- ETL Data Migration: Developed Python ETL script to automate data migration into staging table.
- Star Schema Modelling: Developed Star Schema modelling using Fact table (fact_sales) & Dimension tables (dim_customer, dim_date &
  dim_product).
- Business Intelligence Layer: Validated business objectives directly in SQL.
- Exploratory Analytics: Validate findings & explore quick-level insights in Excel.
- Executive Dashboard: Developed pages including executive overview, product performance, discount optimization & customer insights.

## 📌 Executive Overview (2017 Audit)
In 2017, the business saw a significant **divergence between volume and value**. While Sales and Orders grew by **3.43%** and **16.63%** respectively, the bottom line told a different story: **Profit dropped by 4.27%** and **Margins eroded by 7.61%**.

### 🔴 Critical Risk Areas (The "Bleed")
* **Regional Impact:** The **South** region experienced the most severe profit margin decline compared to 2016.
* **Segment Focus:** The **Home Office** segment drove a **54.56%** margin drop.
* **Category Focus:** **Furniture** was the primary detractor, with a localized margin collapse of **-663.95%**.

### 🟢 Strategic Successes (The "Growth Engine")
* **Regional Hero:** The **East** region maintained healthy growth across Sales, Profit, and Orders, particularly within the **Consumer** segment.
* **Top Category:** **Technology** remains the most resilient category, maintaining positive profit, margin, and order growth.

---

## 🔍 Deep-Dive Insights

### 1. Product Performance: Tables vs. Copiers
* **The Risk:** **Tables** are fundamentally unprofitable, with **63.64% of all orders resulting in a loss** and a negative net margin of **14.52%**.
* **The Success:** **Copiers** show zero orders at loss. Specifically, the **Canon imageClass 2200 Advanced Copier** alone contributes **85.67%** of the category's total profit.

### 2. Discount Optimization
* **The Furniture Trap:** High Discounts (**30%+**) are the direct cause of negative profit in the Furniture category.
* **The Copier Strategy:** Copier products contribute a **37% profit margin** when no discount is applied. Even under aggressive discounting (30%+), they only experience a minor margin dip of **8.85%**.

### 3. Customer Concentration Analysis
* **The Loss Drivers:** Just two customers—**Dean Percer & Ross Baird**—account for **54.38%** of the total loss in the Furniture category. 
* **The Value Drivers:** Conversely, **Raymond Buch & Hunter Lopez** contribute **85.67%** of total profit, highlighting a high dependency on a small group of high-value accounts.

---

## 💡 Recommendations
1. **Discount Capping:** Implement a maximum 20% discount cap on the Furniture category to prevent "Deep Loss" transactions.
2. **Product Audit:** Re-evaluate the base pricing and logistics costs for **Tables**, as the current 63% loss rate is unsustainable.
3. **Account Management:** Perform a profitability audit on high-volume outliers like Dean Percer to ensure future sales align with margin targets.

---

## 🛠️ Tech Stack
* **Data Cleaning:** Python (Pandas/NumPy)
* **Data Modeling:** SQL (MySQL)
* **Visualization:** Power BI
