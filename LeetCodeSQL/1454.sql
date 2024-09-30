WITH login_mod AS
    (SELECT id, name, login_date, RANK() OVER (PARTITION BY id ORDER BY login_date) AS order_id, DATE_SUB(login_date, INTERVAL RANK() OVER (PARTITION BY id ORDER BY login_date) DAY ) AS rn_date
    FROM (SELECT DISTINCT L.id, L.login_date, A.name FROM Logins L JOIN Accounts A ON L.id = A.id) l)

SELECT DISTINCT id, name
FROM login_mod
GROUP BY rn_date, id
HAVING COUNT(*) >= 5


# Let's break down: DATE_SUB(login_date, INTERVAL RANK() OVER (partition by id order by login_date) DAY ) AS rn_date
    # RANK() OVER (partition by id order by login_date): It's ranking the id order by login date
    # INTERVAL RANK() OVER (...) DAY: This is converting into day
    # DATE_SUB(date, day): This is subtracting day from the date
