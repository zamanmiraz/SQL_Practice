SELECT SUM(B.apple_count + IFNULL(C.apple_count, 0)) apple_count, SUM(B.orange_count + IFNULL(C.orange_count, 0)) orange_count
FROM Boxes B LEFT JOIN Chests C ON B.chest_id = C.chest_id
