# Netflix Content Analysis

## Overview
Analyzed Netflix content across two related tables to uncover trends 
in content distribution, release patterns, and country contributions 
using PostgreSQL. Focused on answering business questions a streaming 
company's data team would realistically investigate.

## Dataset
- Source: Netflix Movies and TV Shows (two-table relational database)
- Tables: netflix_titles_info (show details), netflix_people (directors/cast)
- 20 titles across movies and TV shows
- Columns: title, type, country, date added, release year, rating, 
  duration, genre, director, cast

## Business Questions Answered
1. How many movies vs TV shows are in the database?
2. When was the most recent content added to Netflix?
3. Which directors are associated with specific titles?
4. What is the oldest movie in the database?
5. How do countries rank by content contribution?
6. How does content distribute across release eras?

## SQL Concepts Used
JOINs | CTEs | Window Functions | PARTITION BY | RANK() | SUM() OVER |
COUNT | MAX | ORDER BY | LIMIT | CASE Statements | Filtering | NULL handling

## Key Findings
- The majority of content in the dataset is rated TV-MA
- Most titles were added to Netflix in 2021
- United States contributes the most content of any single country
- Content skews heavily toward 2010s and 2020s releases