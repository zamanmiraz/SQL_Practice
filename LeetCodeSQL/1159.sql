# Write your MySQL query statement below
# Which one is the second item
# Left join with items
# Which one is thier favourite brand -> Users

WITH rank_sold_items AS
    (
        SELECT o.seller_id, o.order_date, i.item_brand, ROW_NUMBER() OVER(PARTITION BY seller_id ORDER BY order_date) rnk
        FROM Orders o LEFT JOIN Items i ON o.item_id = i.item_id
    ),
rank_sold_items2 AS
    (
        SELECT * FROM rank_sold_items WHERE rnk = 2
    )

SELECT u.user_id seller_id, CASE 
                                WHEN u.favorite_brand = r.item_brand THEN "yes"
                                ELSE "no" 
                            END AS 2nd_item_fav_brand 
FROM Users u LEFT JOIN rank_sold_items2 r ON u.user_id = r.seller_id
