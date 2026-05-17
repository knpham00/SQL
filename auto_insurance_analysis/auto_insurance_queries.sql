-- ================================================
-- DATASET: Auto Insurance Claims Analysis
-- Analyzes 1,000 auto insurance claims to uncover
-- trends in fraud, claim severity, demographics,
-- and risk factors relevant to P&C insurance
-- Source: Kaggle - Auto Insurance Claims Data
-- Written in PostgreSQL dialect via Supabase
-- ================================================


-- ================================================
-- BASIC QUERIES
-- ================================================

-- COUNT: Total number of claims in the dataset
-- Establishes baseline volume for the analysis

SELECT COUNT(*) AS total_claims
FROM auto_insurance_claims;


-- COUNT + GROUP BY: Claims by incident type
-- Shows which types of incidents occur most frequently

SELECT 
  incident_type, 
  COUNT(*) AS claim_count
FROM auto_insurance_claims
GROUP BY incident_type
ORDER BY claim_count DESC;


-- AVG + GROUP BY: Average claim amount by incident severity
-- Shows how severity level drives claim costs

SELECT
    incident_severity,
    COUNT(*) AS claim_count,
    ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim_amount
FROM auto_insurance_claims
GROUP BY incident_severity
ORDER BY avg_claim_amount DESC;


-- FILTER + COUNT: Total fraudulent claims
-- Isolates fraud cases to understand exposure

SELECT COUNT(*) AS fraud_claims
FROM auto_insurance_claims
WHERE fraud_reported = 'Y';


-- SUM + CASE: Fraud rate by incident type
-- Shows which incident types have the highest fraud frequency

SELECT 
  incident_type,
  COUNT(*) AS total_claims,
  SUM(CASE 
    WHEN fraud_reported = 'Y'
    THEN 1
    ELSE 0
    END) AS fraud_count,
  ROUND(100.0 * SUM(CASE 
    WHEN fraud_reported = 'Y'
    THEN 1
    ELSE 0
    END) / COUNT(*), 1) AS fraud_rate_pct
FROM auto_insurance_claims
GROUP BY incident_type
ORDER BY fraud_rate_pct DESC;


-- AVG + GROUP BY: Average annual premium by policy state
-- Identifies which states generate the most premium revenue

SELECT 
  policy_state,
  ROUND(AVG(policy_annual_premium)::numeric, 2) AS avg_annual_policy_prem,
  COUNT(*) AS num_of_policies
FROM auto_insurance_claims
GROUP BY policy_state
ORDER BY avg_annual_policy_prem DESC;


-- COUNT + AVG: Claim volume and average amount by vehicle make
-- Shows which car brands appear most in claims

SELECT 
  auto_make,
  COUNT(*) AS claim_count,
  ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim_amt_per_make
FROM auto_insurance_claims
GROUP BY auto_make
ORDER BY claim_count DESC;


-- ================================================
-- ADVANCED QUERIES
-- ================================================

-- CTE: Summarize claim metrics by incident severity
-- Shows clean, readable logic using WITH statement

WITH claim_calculations AS (
  SELECT 
    incident_severity,
    COUNT(*) AS total_claims,
    ROUND(AVG(total_claim_amount)::numeric, 2) AS total_avg_claim,
    ROUND(AVG(injury_claim)::numeric, 2) AS avg_injury_claim,
    ROUND(AVG(vehicle_claim)::numeric, 2) AS avg_vehicle_claim,
    ROUND(AVG(property_claim)::numeric, 2) AS avg_property_claim,
    SUM(CASE 
      WHEN fraud_reported = 'Y'
      THEN 1
      ELSE 0
      END) AS fraud_count
  FROM auto_insurance_claims
  GROUP BY incident_severity
)
SELECT *,
  ROUND(100.0 * fraud_count / total_claims, 1) AS fraud_rate_pct
FROM claim_calculations
ORDER BY total_avg_claim DESC;


-- WINDOW FUNCTION: Rank states by average claim amount
-- Shows relative claim cost by geography without losing state detail

SELECT 
  incident_state,
  COUNT(*) AS claim_count,
  ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim_amount,
  RANK() OVER (ORDER BY AVG(total_claim_amount) DESC) AS state_rank
FROM auto_insurance_claims
GROUP BY incident_state
ORDER BY state_rank;


-- WINDOW FUNCTION: Compare each claim to its incident type average
-- Identifies outlier claims that exceed their category benchmark

SELECT 
  policy_number,
  incident_type,
  total_claim_amount,
  ROUND(AVG(total_claim_amount)::numeric OVER (PARTITION BY incident_type), 2) AS avg_claim_for_type,
  ROUND((total_claim_amount - AVG(total_claim_amount) OVER (PARTITION BY incident_type))::numeric, 2) AS diff_from_avg
FROM auto_insurance_claims
ORDER BY incident_type, diff_from_avg DESC;


-- CASE STATEMENT: Segment customers by risk profile
-- Categorizes policyholders based on claim severity and fraud indicators

SELECT 
  policy_number,
  age,
  insured_sex,
  total_claim_amount,
  fraud_reported,
  incident_severity,
  CASE 
    WHEN fraud_reported = 'Y' AND incident_severity = 'Total Loss' THEN 'High Risk'
    WHEN fraud_reported = 'Y' OR incident_severity = 'Total Loss' THEN 'Medium Risk'
    WHEN incident_severity = 'Major Damage' THEN 'Moderate Risk'
    ELSE 'Low Risk'
  END AS risk_profile
FROM auto_insurance_claims
ORDER BY total_claim_amount DESC;


-- CTE + WINDOW FUNCTION: Rank vehicle models by average claim within each make
-- Combines CTE and window function to identify highest risk models per brand

WITH vehicle_claims AS (
  SELECT 
    auto_make,
    auto_model,
    auto_year,
    COUNT(*) AS claim_count,
    ROUND(AVG(total_claim_amount)::numeric, 2) AS avg_claim_amount
  FROM auto_insurance_claims
  GROUP BY auto_make, auto_model, auto_year
)
SELECT  
  auto_make,
  auto_model,
  auto_year,
  claim_count,
  avg_claim_amount,
  RANK() OVER (PARTITION BY auto_make ORDER BY avg_claim_amount DESC) AS model_rank_within_make
FROM vehicle_claims
ORDER BY auto_make, model_rank_within_make;