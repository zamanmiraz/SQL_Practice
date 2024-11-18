# Write your MySQL query statement below
WITH txs_debit AS
    (
        SELECT paid_to, SUM(amount) debit_amount
        FROM Transactions
        GROUP BY paid_to
    ),

txs_credit AS
    (
        SELECT paid_by, -SUM(amount) credit_amount
        FROM Transactions
        GROUP BY paid_by
    )

SELECT user_id, user_name, (IFNULL(debit_amount, 0) + IFNULL(credit_amount, 0) + credit) credit, IF(IFNULL(debit_amount, 0) + IFNULL(credit_amount, 0) + U.credit < 0, 'Yes', 'No') credit_limit_breached
FROM Users U LEFT JOIN txs_debit td ON U.user_id = td.paid_to
             LEFT JOIN txs_credit tc ON U.user_id = tc.paid_by
