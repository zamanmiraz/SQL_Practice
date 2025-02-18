WITH income AS
    (
        SELECT t.account_id, DATE_FORMAT(t.day, '%Y%m') AS income_month, SUM(amount) total_income, a.max_income
        FROM Transactions t LEFT JOIN Accounts a ON t.account_id = a.account_id
        WHERE type = 'Creditor'
        GROUP BY account_id, income_month
        HAVING total_income > a.max_income 
        ORDER BY 1, 2
    )

SELECT DISTINCT i1.account_id
FROM income i1, income i2
WHERE PERIOD_DIFF(i1.income_month, i2.income_month) = 1 AND i1.account_id = i2.account_id
