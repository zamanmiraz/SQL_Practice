WITH user_contact AS 
    (SELECT C.user_id, contacts_cnt, trusted_contacts_cnt
    FROM
        (SELECT user_id, COUNT(user_id) contacts_cnt 
        FROM Contacts 
        GROUP BY user_id) C

    LEFT JOIN

        (SELECT user_id, COUNT(user_id) trusted_contacts_cnt 
        FROM Contacts
        JOIN Customers ON Contacts.contact_email = Customers.email
        GROUP BY user_id) TC

    ON C.user_id = TC.user_id),

invoice_name AS
    (
        SELECT invoice_id, price, user_id, customer_name 
        FROM Invoices I
        LEFT JOIN Customers C ON I.user_id = C.customer_id
    )

SELECT invoice_id, customer_name, price, IFNULL(contacts_cnt, 0) contacts_cnt, IFNULL(trusted_contacts_cnt, 0) trusted_contacts_cnt
FROM invoice_name i_n
LEFT JOIN user_contact u_c ON i_n.user_id = u_c.user_id
ORDER BY invoice_id
