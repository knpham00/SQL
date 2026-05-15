# Fortune 500 Company Analysis

## Overview
Analyzed Fortune 500 company data to uncover trends in revenue performance, 
employee benefits, and industry benchmarking using PostgreSQL. Focused on 
identifying which industries and companies offer the strongest compensation 
packages and how companies compare to their industry peers.

## Dataset
- Source: Fortune 500 custom database
- 43 companies across 8 industries
- Columns: company name, industry, revenue, employees, healthcare benefits, 
  PTO days, maternity leave weeks, avg employee tenure

## Business Questions Answered
1. Which companies offer the most generous paid time off?
2. Which companies provide both healthcare benefits and strong maternity leave?
3. How do companies rank by revenue within their own industry?
4. How does each company's revenue compare to their industry average?
5. How do Finance industry companies segment by revenue tier?

## SQL Concepts Used
CASE Statements | CTEs | Window Functions | PARTITION BY | RANK() | 
AVG() | GROUP BY | HAVING | Filtering | ROUND()

## Key Findings
- Technology and Manufacturing industries lead in average revenue
- Companies offering healthcare benefits consistently offer more PTO 
  and longer maternity leave
- Significant revenue variance exists within industries, with top 
  performers earning 2-3x the industry average