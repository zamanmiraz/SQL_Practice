## Difference between MySQL and SQL server?

| Feature           | MySQL                                   | SQL Server                               |
|------------------|--------------------------------------|-----------------------------------------|
| **Developer**    | Oracle Corporation                  | Microsoft                               |
| **Platform**     | Open-source                         | Proprietary (paid versions available)  |
| **Operating System** | Cross-platform (Windows, Linux, macOS) | Primarily Windows, but supports Linux |
| **Syntax Differences** | Uses `LIMIT` for pagination | Uses `TOP` or `OFFSET FETCH` |
| **Transaction Support** | Supports transactions with InnoDB engine | Fully supports transactions |
| **Security** | Basic user privileges | Advanced security features (e.g., row-level security, Always Encrypted) |
| **Stored Procedures** | Supports but with fewer features | More powerful stored procedure support |
| **JSON Support** | Native JSON functions | Supports JSON but with less flexibility |
| **Replication** | Master-slave, master-master replication | Advanced replication, Always On availability groups |
| **Performance** | Optimized for read-heavy workloads | Optimized for enterprise-level applications |
