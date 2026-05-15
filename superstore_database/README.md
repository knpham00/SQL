# Superstore Product Analysis

## Overview
Analyzed a retail superstore product database to uncover trends in 
pricing, inventory management, and customer ratings using PostgreSQL. 
Focused on answering business questions around category performance, 
product benchmarking, and inventory health.

## Dataset
- Source: Superstore custom product database
- 15 products across 4 categories
- Columns: item name, category, price, stock quantity, average rating

## Business Questions Answered
1. How are products distributed across price tiers?
2. Which categories carry the most inventory value?
3. How do individual products rate compared to their category average?
4. Which items are overstocked, healthy, low, or critically low?
5. How does each product's price rank within its own category?

## SQL Concepts Used
JOINs | CTEs | Window Functions | PARTITION BY | RANK() | AVG() OVER |
ORDER BY | GROUP BY | CASE Statements | Filtering | Aggregations | ROUND()

## Key Findings
- Electronics carries the highest total inventory value despite 
  having fewer items than other categories
- Premium priced items ($200+) tend to have higher average ratings 
  than budget items
- Several items are critically low on stock, signaling reorder priority
- Kitchen Supplies has the strongest average customer rating 
  across all categories