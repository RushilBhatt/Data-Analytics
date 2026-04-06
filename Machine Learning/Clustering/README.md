# Customer Segmentation using CLustering

## Business Context
Identifying distinct consumer behaviors from raw credit card usage data is a complex task that requires grouping customers with shared
characteristics to move beyond broad marketing. The objective is to develop a machine learning clustering model that segments active 
cardholders into target groups to enable personalized financial recommendations like savings plans and loans.

## Dataset
- 'Customer_Data_CSV': Contains customer level information with 18 variables.

## Approach
- Data Exploration 
  - Checking data type 
  - Checking null values per column
- Data Cleaning
  - Performing missing value imputation
- Data Visualization
  - Univariate Analysis

## Predictive Analytics
- Used clustering using K Means
- Used Silhouette Score to determine how well-separated the clusters are.
- Since KNN Means with k = 2 gives the highest Silhouette Score, we will choose it as our model.
- Based on the customer profiling, it was found that cluster 0 are premium & active customers who make higher & more often purchases 
  with a high account balance while cluster 1 are are less engaged customers who make lower & less often purchases with a moderate 
  account balance.
- Based on the insights, XYZ Marketing should invest in invest in customers to keep them loyal for cluster 0 while they should focus 
  on increasing the usage of customers in cluster 1.

## Tools Used
Python, Pandas
