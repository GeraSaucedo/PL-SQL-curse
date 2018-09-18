SET SERVEROUTPUT ON;

DECLARE

	--Declare variables
	x_emp 	employee%ROWTYPE;

BEGIN

	--Retrieve the salary data
	SELECT fname, lname, sex, salary
	INTO x_emp.fname, x_emp.lname, x_emp.sex, x_emp.salary
	FROM Employee
	WHERE SSN = '333445555';

	--Display the results
	DBMS_OUTPUT.PUT_LINE(x_emp.fname || ' ' || x_emp.lname || ' salary is $' || x_emp.salary);

END;
/