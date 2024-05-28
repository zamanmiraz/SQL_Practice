# 1070. Product Sales Analysis III (https://leetcode.com/problems/product-sales-analysis-iii/)
# Idea:
    #1 Create a sub-query Group by the product id and find the minimum year 
    #2 Then use the main query to find the product , year, quantity, and price
    
SELECT first_product.product_id, first_year, quantity, price

FROM Sales, 
        (SELECT product_id, MIN(year) as first_year
        FROM Sales
        GROUP BY product_id) as first_product

WHERE Sales.product_id = first_product.product_id AND Sales.year = first_product.first_year;
