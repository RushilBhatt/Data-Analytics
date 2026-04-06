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

## Key Insights

- **Employment is a strong risk indicator**  
  Unemployment, maternity leave, and low-skill jobs show higher default risk, while stable professions (accountants, pensioners, businessmen) show lower risk.

- **Credit score and loan type are critical factors**  
  Low external credit scores strongly correlate with defaults. Cash loans (especially for apartments) carry higher risk than revolving loans.

- **Demographics influence repayment behavior**  
  Larger households and lower education levels are associated with higher default rates, while degree holders and smaller households show lower risk.

---

## Credit Risk Policy Summary

### Decline
- Unemployed applicants  
- Low external credit score (Q1_Low)  
- Cash loans for apartments  
- Lower secondary education in high-risk segments  

### Review
- Low-skill occupations  
- Large households / complex family structures  
- Cash loan applications requiring higher collateral  
- Asset-backed unemployed applicants (manual review required)  

### Approve
- Stable employment groups (pensioners, accountants, businessmen, students)  
- Academic degree holders  
- High external credit score applicants (Q4_High)  
- Revolving loans with stable housing profiles  

---

## Tools Used
- Python  
- Pandas  
- Seaborn  
- Jupyter Notebook  
