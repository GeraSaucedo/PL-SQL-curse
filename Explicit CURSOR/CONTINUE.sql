--------------------------------------------------------------------------
-- 			      CONTINUE STATEMENT			--
--------------------------------------------------------------------------
/*
	Unlike EXIT which terminates the execution of a loop in its entirety,
	CONTINUE terminates the current iterarion of the loop
	- Like EXIT, the continue statement includes a WHEN clause
*/
SET SERVEROUTPUT ON
DECLARE

	--Declare the cursor
	CURSOR Employees IS
		SELECT *
		FROM employee
		ORDER BY salary DESC;

	--Declare the row tyoe associated to the CURSOR
	EmpRecords employee%ROWTYPE;

BEGIN
	--Open the cursor
	IF NOT (Employees%ISOPEN) THEN
		OPEN Employees;
	END IF;

	--Begin the indefinite loop
	LOOP
		
		--retrieve the CURSOR sata into the holding object
		FETCH Employees INTO EmpRecords;

		--Test whether a record	was found
		EXIT WHEN Employees%NOTFOUND;

		--Continue doesnt allow Display the odd records 
		CONTINUE WHEN MOD(Employees%ROWCOUNT,2) != 0;

		--Display the record detail
		DBMS_OUTPUT.PUT_LINE(	'Employees number ' || Employees%ROWCOUNT ||
					' ' || EmpRecords.LName || ' earns $' ||
					EmpRecords.Salary);
	
	END LOOP;
	
	--CLOSE the cursor
	IF Employees%ISOPEN THEN
		CLOSE Employees;
	END IF;
	
	
	
END;
/
