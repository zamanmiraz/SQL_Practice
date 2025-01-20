SELECT product_id, MAX(CASE WHEN store='store1' THEN price END) store1, MAX(CASE WHEN store='store2' THEN price END) store2, MAX(CASE WHEN store='store3' THEN price END) store3
FROM Products
GROUP BY product_id
ORDER BY product_id
