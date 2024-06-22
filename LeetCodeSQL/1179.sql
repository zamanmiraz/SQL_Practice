SELECT id,
MAX(IF(MONTH = "Jan", revenue, NULL)) AS Jan_Revenue,
MAX(IF(MONTH = "Feb", revenue, NULL)) AS Feb_Revenue,
MAX(IF(MONTH = "Mar", revenue, NULL)) AS Mar_Revenue,
MAX(IF(MONTH = "Apr", revenue, NULL)) AS Apr_Revenue,
MAX(IF(MONTH = "May", revenue, NULL)) AS May_Revenue,
MAX(IF(MONTH = "Jun", revenue, NULL)) AS Jun_Revenue,
MAX(IF(MONTH = "Jul", revenue, NULL)) AS Jul_Revenue,
MAX(IF(MONTH = "Aug", revenue, NULL)) AS Aug_Revenue,
MAX(IF(MONTH = "Sep", revenue, NULL)) AS Sep_Revenue,
MAX(IF(MONTH = "Oct", revenue, NULL)) AS Oct_Revenue,
MAX(IF(MONTH = "Nov", revenue, NULL)) AS Nov_Revenue,
MAX(IF(MONTH = "Dec", revenue, NULL)) AS Dec_Revenue
FROM Department
GROUP BY id
ORDER BY id
