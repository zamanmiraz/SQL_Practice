# Recursive CTE (Common Table Expression)

## Introduction
A **Recursive CTE** is a powerful SQL feature that perform recursive queries. It is commonly used to generate sequences, traverse hierarchical data, or solve problems that require iterative logic.

---

## What is a Recursive CTE?
A Recursive CTE is a temporary result set that references itself to repeatedly execute a query until a termination condition is met. It consists of two main parts:
1. **Anchor Member**: The base case that provides the initial row(s).
2. **Recursive Member**: The part that references the CTE itself to build on the previous result.

---

## Syntax
```sql
WITH RECURSIVE cte_name AS (
    -- Anchor Member
    SELECT initial_row
    UNION ALL
    -- Recursive Member
    SELECT next_row
    FROM cte_name
    WHERE termination_condition
)
SELECT * FROM cte_name;
