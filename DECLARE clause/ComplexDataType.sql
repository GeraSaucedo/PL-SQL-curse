/*-------------------DECLARE COMPLEX TYPES---------------
	PL/SQL is tightly integrated with the oracle database
	- %TYPE
	- %ROWTYPE

	PL/SQL also supports advanced and object-oriented programming structures
	- TYPE...TABLE
	- TYPE...RECORD

	%TYPE may be dymanically and automatically matched to any column within the oracle table
	
		Employees.salary%TYPE

	%TYPE can be used to reference a Schema 

		HR.Employees.Salary%TYPE
*/

--Set the server to output the results
SET SERVEROUTPUT ON
DECLARE
	
	--Declare variables
	x_salary Employee.Salary%TYPE;
	x_last	 Employee.lname%TYPE;

BEGIN

	--Retrieve the salary data
	SELECT salary, lname 
	INTO x_salary, x_last
	FROM Employee
	WHERE SSN = '999887777';

	--Display the results
	DBMS_OUTPUT.PUT_LINE(x_last || ' salary is $' || x_salary);

END;
/