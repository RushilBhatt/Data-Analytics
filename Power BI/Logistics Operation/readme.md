# Logistics Operation

## Business Context
In global logistics, tracking volume and transport milestones is critical to managing capacity and client satisfaction. This project replicates a real-world scenario where data is captured across fragmented tables (`Jobs`, `Shipments`, and `Containers`), plagued by data integrity anomalies caused by multi-source entries.

## Dataset 
- Contains 3 files:
  - 'Jobs_Raw.csv':Represents the overarching booking or master operational file for a specific voyage, project, or transport consolidation.
     * `Job_No` *(Primary Key / Unique Identifier)*: The master tracking number for the job.
  - 'Shipments_Raw.csv':Represents the specific commercial cargo belonging to individual customers, grouped underneath an overarching
     operational job.
  - 'Containers_Raw.csv':Tracks the physical metal intermodal equipment moving on ships or rail. Used to audit and cross-verify actual
      vs declared cargo volumes.
  - 'Mappings.csv':A standardized dimension table used to normalize values, fix human data entry errors, and clean mismatched text
     strings during the ETL pipeline.
 
  ## Approach
  - Data Cleaning (Power Query)
    -  Trimming whitespaces
    -  Standardizing text cases
    -  Removing duplicates
    -  Performing TEU validation
   
  - Data Visualization
    - Executive Summary: This page gives a quick overall overview of shipment operations and important KPIs for management.
    - Operational Insights: This page focuses more on shipment operations, customer activity, and trade lane performance.
    - Data Quality Monitoring: This page focuses on checking data completeness and identifying data quality issues.

## Insights

*   **2025 Volume Dominance & Forecasting Risk:** 2025 dominates shipment volume, contributing about **7x more total TEU** compared to 2026. The higher missing TEU in 2025 compared to 2026 does not contradict the higher total TEU, as missing values are independent of aggregate volume. 2025 has a larger shipment base, resulting in both higher absolute missing counts and higher total TEU.
*   **Severe Capacity & Operational Bottlenecks:** Cargo marked with a **"Shut Out"** status represents the single largest operational category at **27.88%**.
*   **System Integration & Relational Gaps:** A baseline of **9.17% of shipments are classified as "Orphan" records**, meaning they lack a valid parent `Job_No` link. While the majority of shipments are properly matched, this gap highlights weaknesses in data linkage. Immediate focus should be on improving data completeness and system integration to enhance reporting accuracy and reduce orphan counts. 








 
