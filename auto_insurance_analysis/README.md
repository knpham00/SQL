# Auto Insurance Claims Analysis

## Overview
Analyzed 1,000 auto insurance claims to uncover trends in fraud exposure, 
claim severity, geographic risk, and vehicle performance using PostgreSQL 
via Supabase. This project simulates the type of analysis performed by 
data analysts at property and casualty insurance companies to support 
underwriting, fraud detection, and risk segmentation decisions.

## Dashboard
🔗 [View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/kim.pham3676/viz/AutoInsuranceClaimsAnalysis_17790505745000/AutoInsuranceClaimAnalysis)

## Dataset
- Source: Kaggle - Auto Insurance Claims Data
- 1,000 claims across 7 states
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
SUM + CASE | GROUP BY | Aggregations | ROUND() | 
Filtering | Type Casting (::numeric)

## Key Findings
- Single Vehicle Collisions have the highest fraud rate at 29% — 
  counterintuitively higher than Vehicle Theft at 8.5%
- Major Damage claims average slightly higher than Total Loss claims 
  ($64,067 vs $62,081), suggesting severity classification alone 
  doesn't predict cost
- New York and South Carolina carry the highest average claim amounts 
  at $56,388 and $54,589 respectively
- High Risk policyholders represent the smallest segment but carry 
  the highest individual claim amounts — concentrated loss exposure 
  in a small group
- Trivial Damage claims average just $5,302 — dramatically lower than 
  all other severity categories

## Why This Matters
These findings directly support core insurance business functions:
- **Underwriting** — identify high risk demographics and vehicles 
  for more accurate premium pricing
- **Fraud Detection** — flag incident types with elevated fraud rates 
  for investigation
- **Claims Management** — benchmark individual claims against category 
  averages to identify outliers

## Tools Used
PostgreSQL | Supabase | Tableau Public | VS Code | GitHub