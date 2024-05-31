# Write your MySQL query statement below
# Without using Join
SELECT DISTINCT(buyer_id)
FROM SALES 
WHERE product_id = (SELECT product_id FROM Product WHERE product_name = 'S8' ) AND buyer_id NOT IN
                            (SELECT DISTINCT(buyer_id) 
                                FROM SALES 
                                WHERE product_id =  (SELECT product_id FROM Product WHERE product_name = 'iPhone' ));

# Using Join
SELECT DISTINCT(s.buyer_id)
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id and p.product_name = 'S8'
WHERE s.buyer_id NOT IN
    (SELECT DISTINCT(s.buyer_id)
    FROM Sales s
    JOIN Product p
    ON s.product_id = p.product_id and p.product_name = 'iPhone');
