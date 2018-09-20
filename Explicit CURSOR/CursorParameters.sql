--------------------------------------------------------------------------
-- 			      CURSOR WITH PARAMETERS			--
--------------------------------------------------------------------------
/*
	The search criteria stated within the cursor declaration may be 
	altered each time the cursor is opened by the means of a parameter.
	
	PARAMETERS RULES:
	- Parameter are defined within the CURSOR declaration
	- Parameters are used in the WHERE clause
	- The Parameter value is passed when the cursor is opened

*/
SET SERVEROUTPUT ON;
DECLARE
	
	--Declare the cursor
	CURSOR Employees (SupSSN Employee.Superssn%TYPE)IS
		SELECT * 
		FROM employee
		WHERE SuperSSN = SupSSN;

	EmpRecords 	employee%ROWTYPE;

	
BEGIN
	IF NOT (Employees%ISOPEN) THEN
		OPEN Employees(123456789);	
	END IF;

	LOOP

		FETCH Employees INTO EmpRecords;

		EXIT WHEN EMPLOYEES%NOTFOUND;

		DBMS_OUTPUT.PUT_LINE('Employee found: ' || EmpRecords.LName ||
					' SuperSSN: ' || EmpRecords.SuperSSN);

	END LOOP;




	IF NOT (Employees%ISOPEN) THEN
		CLOSE Employees;	
	END IF;

	

	
END;
/