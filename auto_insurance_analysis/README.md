# Auto Insurance Claims Analysis

## Overview
Analyzed 1,000 auto insurance claims to uncover trends in fraud exposure, 
claim severity, geographic risk, and vehicle performance using PostgreSQL 
via Supabase. This project simulates the type of analysis performed by 
data analysts at property and casualty insurance companies to support 
underwriting, fraud detection, and risk segmentation decisions.

## Dataset
- Source: Kaggle - Auto Insurance Claims Data
- 1,000 claims across multiple states and vehicle types
- Columns: policy details, customer demographics, incident type, 
  claim amounts (total, injury, property, vehicle), fraud indicator, 
  vehicle make/model/year

## Business Questions Answered
1. Which incident types generate the most claims and highest costs?
2. How does claim severity impact total payout amounts?
3. Which states carry the highest average claim amounts?
4. What percentage of claims are fraudulent by incident type?
5. Which vehicle makes and models are associated with the highest claims?
6. How do individual claims compare to their incident type average?
7. How can policyholders be segmented by risk profile?

## SQL Concepts Used
CTEs | Window Functions | PARTITION BY | RANK() | AVG() OVER |
SUM + CASE | GROUP BY | HAVING | Aggregations | ROUND() | 
Filtering | Subqueries | Type Casting (::numeric)

## Key Findings
- Total Loss claims average significantly higher payouts than 
  Minor Damage claims
- Vehicle Theft incidents carry a disproportionately high fraud rate
  compared to collision-based claims
- Significant geographic variance exists in average claim amounts 
  across states, suggesting regional risk differences
- High Risk policyholders (fraudulent Total Loss claims) represent 
  a small but costly segment of the overall book of business
- Certain vehicle models within the same make carry 2-3x higher 
  average claims than their brand peers

## Why This Matters
These findings directly support core insurance business functions:
- **Underwriting** — identify high risk demographics and vehicles 
  for more accurate premium pricing
- **Fraud Detection** — flag incident types and profiles with 
  elevated fraud rates for investigation
- **Claims Management** — benchmark individual claims against 
  category averages to identify outliers