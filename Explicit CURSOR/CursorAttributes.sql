--------------------------------------------------------------------------
-- 			      CURSOR ATTRIBUTES 			--
--------------------------------------------------------------------------
/*
	Explicit cursors have the same attributes as implicit cursor
	- Names always use the following naming format
	
		CursorName%AttributeName

	CURSOR ATTRIBUTE VALUES
	The values returned by the attributes are slightly different from
	implicit cursors
	- %FOUND and %NOTFOUND indicate whether or not the FETCH statement received data
	- %ROWCOUNT indicates which row the FETCH statement received
	- %ISOPEN is True/False depending on whether the cursor is open and data is available

*/
SET SERVEROUTPUT ON;
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
