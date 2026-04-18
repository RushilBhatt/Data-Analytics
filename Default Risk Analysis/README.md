# Default Risk Analysis

## Business Context
Loan providing companies need to assess loan applicants’ risk profiles to minimize defaults while ensuring fair lending decisions.  
This project identifies key drivers of default risk and translates them into actionable credit policies.

---

## Dataset
- Contains 3 files:
   - 'application_data_csv': contains all information of the client at the time of the application. The data is whether a
      client has payment difficulties. 
   - 'previous_application.csv' contains information about the client’s previous loan data. It contains the data whether the previous
      application had been Approved, Cancelled, Refused or Unused offer
   - 'columns_description.csv' is a data dictionary which describes the meaning of the variables.

---

## Approach
- **Data Exploration**
  - Checking data type
  - Checking descriptive statistics
  - Visualizing null values per column

- **Data Cleaning**
  - Performed missing value imputation 
  - Converted data types 
  - Performed outlier analysis
  - Performed feature binning

- **Data Visualization**
  - Segmented Univariate Analysis  
  - Segmented Bivariate Analysis  
  - Segmented Multivariate Analysis

- **Risk Analysis**
  - Identified high-risk and low-risk applicant groups  
  - Evaluated multi-factor interactions (income, housing, employment, credit score)  
  - Derived business rules for credit decision-making  

---

## 💡 Key Insights

Based on the multi-factor risk analysis, the following trends were identified:

* **🎓 Education as a Shield:** Higher educational attainment (Academic Degrees) is the strongest predictor of financial resilience. It effectively offsets risk even during volatile life events like unemployment or maternity leave.
* **🏆 The Reliability Leaders:** **Accountants** and **Pensioners** are the most stable borrowers across all income levels. Among female applicants, **Widows** consistently demonstrate the most disciplined repayment behavior.
* **🏢 Housing over Ownership:** Interestingly, applicants residing in **Office or Municipal apartments** show higher reliability than those in private rentals or general home ownership.
* **⚠️ The Asset Paradox:** Possessions don't equal payments. Just because someone owns a car or house doesn't mean they are a safe borrower. A person's track record (behavior) is a much better predictor of risk than the physical things they own.
* **💍 Marital Proxies:** "Civil Marriage" status, particularly in lower income brackets, tends to correlate with less conservative financial planning compared to traditional marital statuses.

---

## 🛡️ Credit Risk Policy Summary

To optimize the portfolio, the following "Traffic Light" policy is recommended:

### 🛑 1. Mandatory Decline (High Risk)
* **Unemployment:** Applicants without steady income, especially those with lower secondary education.
* **Low External Scores:** Any applicant falling into the **Q1_Low** bracket.
* **High-Risk Combinations:** Cash loans for apartments or "Civil Marriage" applicants seeking real estate/car repair funding.
* **History:** Applicants in rented housing with a history of **"Refused"** or **"Cancelled"** contracts.

### ⚠️ 2. Manual Review & Mitigation (Moderate Risk)
* **Household Strain:** Large families (5+ members) require stricter Debt-to-Income (DTI) checks or a **co-signer**.
* **Asset-Backed Unemployed:** Applicants with no job but high-value assets must undergo **manual review** for fully secured lending options.
* **Role Volatility:** Specific roles like **Commercial Associates**, even those with degrees, require secondary verification due to income fluctuation.
* **Collateral Requirements:** Cash loan applications in mid-tier segments require **higher collateral** or insurance flags.

### ✅ 3. Instant Approval (Low Risk)
* **The "Safe" Professionals:** Accountants, State Servants, Businessmen, and Pensioners.
* **High Resilience:** Academic degree holders and applicants with high external credit scores (**Q4_High**).
* **Stable Demographics:** Small households (0–2 members) and female widows.
* **Product Fit:** **Revolving loans** for applicants with stable housing profiles (Office/Municipal).

---

## Tools Used
- Python  
- Pandas  
- Seaborn  
- Jupyter Notebook

## Project Link
### 📊 Project Analysis
**[Click this link for the full project analysis](https://nbviewer.org/github/RushilBhatt/Data-Analytics/blob/fe491c7c6acfd3054314c769d0760c31b53776af/Default%20Risk%20Analysis/Default-Risk-Analysis.ipynb)**
