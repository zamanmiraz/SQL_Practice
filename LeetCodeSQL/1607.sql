SELECT DISTINCT(seller_name) 
FROM Orders O RIGHT JOIN Seller S ON O.seller_id = S.seller_id
WHERE S.seller_id NOT IN (SELECT DISTINCT(seller_id) FROM Orders WHERE YEAR(sale_date) = 2020)
ORDER BY 1 ASC; 
