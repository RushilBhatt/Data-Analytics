 # Medical Diagnosis Problem using Classification

## Business Context
Identifying diabetes is a complex, multi-factor challenge where manual analysis of various clinical tests can lead to diagnostic inaccuracies. The objective is to develop a machine learning classification model that accurately detects the presence of diabetes to enhance diagnostic reliability for healthcare professionals.

--- 

## Dataset
Contains 8 medical analyst variables & 1 variable known as 'Outcome'.The ‘outcome’ is the feature that is  predicted where - ‘0’ means
no diabetes ‘1’ means diabetes.

--- 

## Approach
- Data Exploration
   - Checking data type
   - Checking null values per column
- Data Cleaning
   - Performing missing value imputation
   - Peforming outlier analysis
- Data Visualization
   - Segmented Univariate Analysis

--- 

## Predictive Analytics
- Different classification algoirthms used to determine which one works best in predicting diabetes accurately.
- Algorithms used are KNN, Decision Tree & Random Forest.
- The algorithms are evaluated using metrics such as accuracy, precision, recall, F1-score & confusion matrix.
- Random Forest outperforms the others in all metrics — highest accuracy, precision, recall, and F1-score.
- Decision Tree performs worst, with low recall and F1-score, meaning it misses too many diabetic patients.
- Final Recommendation: Random Forest should be chosen as the best model for diabetes prediction, as it provides the most balanced and
  reliable performance.

--- 

## Tools Used
Python, Pandas, SQL, Power BI, etc.
