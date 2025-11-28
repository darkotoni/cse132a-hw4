WITH RECURSIVE Hierarchy AS (
  SELECT ename AS employee_name, managerid
  FROM Employee
  WHERE managerid IS NOT NULL
  
  UNION
  
  SELECT h.employee_name, e.managerid
  FROM Hierarchy h
  JOIN Employee e ON h.managerid = e.eid
  WHERE e.managerid IS NOT NULL
)
SELECT h.employee_name, e.ename AS manager_name
FROM Hierarchy h
JOIN Employee e ON h.managerid = e.eid
ORDER BY employee_name, manager_name;