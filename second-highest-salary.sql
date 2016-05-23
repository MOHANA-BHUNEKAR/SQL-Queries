
# Write a SQL query to get the second highest salary from the Employee table with Id and Salary as Employee table schema.
#
# +----+--------+
# | Id | Salary |
# +----+--------+
# | 1  | 1000   |
# | 2  | 2000    |
# | 3  | 3000   |
# +----+--------+
# For example, given the above Employee table, the second highest salary is 200. If there is no second highest salary, then the query should return null.
#
# Write your MySQL query statement below
SELECT MAX(Salary) FROM Employee
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee)
