# Write your MySQL query statement below
# When the first change of date is occuring for a product after the given date
# Union
# When the maximum change of date is occuring before the given date

SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'

UNION ALL # UNION removes the duplicate/UNION ALL keeps the duplicate

-- Query using WHERE -- IN -- : Shows lower performance becuase of check for each pair of product id and price
-- SELECT product_id, new_price AS price
-- FROM Products
-- WHERE (product_id, change_date)  IN
--         (SELECT product_id, MAX(change_date) AS cd
--         FROM Products
--         WHERE change_date <= "2019-08-16"
--         GROUP BY product_id)

-- Query using JOIN --: Shows higher performance becuase of join
SELECT p.product_id, p.new_price AS price
FROM Products p
JOIN (
    SELECT product_id, MAX(change_date) AS max_change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
) AS latest_changes
ON p.product_id = latest_changes.product_id
AND p.change_date = latest_changes.max_change_date;

