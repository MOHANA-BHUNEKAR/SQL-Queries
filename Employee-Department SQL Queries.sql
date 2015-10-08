Consider the following schema

‘Dept’ table has following fields

1.       deptno

2.       dname

3.       loc

and Employee table has following fields: 
‘Emp’ Table has following fields

1.       empno

2.       ename

3.       job

4.       mgr

5.       hiredate

6.       sal

7.       comm

8.       deptno


SQL queries needs to be implemented: 

1. Find employees who do not manage anybody.

 SELECT * from Employee where empno not in (select mgr from Employee where  mgr is not null);

 

2. Find department that have maximum number of employees. (solution should consider scenario having more than 1 departments that have maximum number of employees). Result should only have - deptname, count of employees sorted by deptname.

 SELECT a.dname,Max(a.NumEmp) AS maxEmpCount FROM ( SELECT d.dname,COUNT(e.empno) AS NumEmp FROM Employee e INNER JOIN Dept d  ON e.deptno = d.deptno GROUP BY e.deptno ) AS a ;

3. Find top 3 employees (salary based) in every department. Result should have deptname, empid, salary sorted by deptname and then employee with high to low salary.

 SELECT D.dname AS Department, E.ename AS Employee, E.sal AS Salary 
FROM Employee E INNER JOIN Dept D ON E.deptno = D.deptno 
WHERE E.sal IN (
    SELECT e1.sal 
    FROM Employee e1 
         WHERE E.deptno = e1.deptno 
    ORDER BY e1.deptno, e1.sal desc
    LIMIT 3
)
ORDER BY E.deptno, E.sal desc;

4. List all employees, their salary and the salary of the person in their department who makes the most money, but less than the employee.

 SELECT e1.ename,e1.sal,MAX(e2.sal) from Employee e1 join Employee e2 on e1.deptno=e2.deptno AND e1.sal>e2.sal group by e1.ename order by e2.sal;