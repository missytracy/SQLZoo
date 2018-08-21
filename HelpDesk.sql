--
SQLZOO Helpdesk Solutions
https://sqlzoo.net/wiki/Help_Desk
--

--
1. There are three issues that include the words 'index' and 'Oracle'.
Find the call_date for each of them.
--

SELECT
  call_date,
  call_ref
FROM
  Issue
WHERE
  Detail LIKE '%index%'
  AND Detail LIKE'%Oracle%'


--
2. Samantha Hall made three calls on 2017-08-14.  Show the date
and time for each.
--

SELECT
  call_date,
  first_name,
  last_name
FROM
  Issue
JOIN
  Caller
ON
  Caller.Caller_id = Issue.Caller_id
WHERE
  first_name = 'Samantha'
  AND last_name = 'Hall'
  AND call_date LIKE '2017-08-14%'


--
3. There are 500 calls in the system (roughly). Write a query that shows
the number that have each status.
--

SELECT
  status,
  COUNT(status) AS volume
FROM
  Issue
GROUP BY
  status


--
4. Calls are not normally assigned to a manager but it does happen.
How many calls have been assigned to staff who are at Manager Level?
--

SELECT
  COUNT(*) AS assigned_to_mgr
FROM
  Issue
JOIN
  Staff
ON
  Staff_code = Assigned_to
JOIN
  Level
ON
  Level.Level_code = Staff.Level_code
WHERE
  Level.Manager = 'Y'


--
5. Show the manager for each shift. Your output should include the shift
date and type; also the first and last name of the manager.
--
SELECT
  Shift_date,
  Shift_type,
  First_name,
  Last_name
FROM
  Shift
JOIN
  Staff
ON
  Shift.Manager = Staff.Staff_code
JOIN
  Level
ON
  Staff.Level_code = Level.Level_code
WHERE
  Level.Manager = 'Y'
ORDER BY
  Shift_date 

--
6. List the company name and the number of calls for those companies with more than 18 calls.
--

SELECT 
	Company_name, 
	COUNT(*)
FROM 
	Customer
JOIN 
	Caller
	ON 
	(Customer.Company_ref = Caller.Company_ref)
JOIN 
	Issue
	ON 
	(Issue.Caller_id = Caller.Caller_id)
GROUP BY 
	Company_name
HAVING 
	COUNT(*) > 18;

-- 
7. Find the callers who have never made a call. Show first name and last name. 
--
SELECT 
	Caller.First_name, 
	Caller.Last_name
FROM 
	Caller
LEFT JOIN 
	Issue
	ON 
	(Caller.Caller_id = Issue.Caller_id)
WHERE 
	Issue.Call_date IS NULL

-- 
8. For each customer show: Company name, contact name, number of calls where the number of calls is fewer than 5.
SELECT Customer.Company_name, Customer.Contact_id, count(*)
FROM Customer
JOIN Caller
ON Customer.Company_ref = Caller.Company_ref
JOIN Issue 
ON Caller.Caller_id = Issue.Caller_id
GROUP BY 1, 2

``test changes for git practice``