--------------------------------------------------------------------------
--		 	 EXPLICIT CURSORS				--
--------------------------------------------------------------------------
/*
	- Explicit cursors are named pointers to rows and columns 
	  within the database
	- They are used whenever sequential processing is required

	- CURSOR declaration must be created within the DECLARE Clause
	
	- A variable containing the structure holding the data must be also created

	- All CURSOR Processing is performed within the BEGIN clause
		1 - The cursor must be opened
		2 - The fetch statement advances the CURSOR pointer to the next record
		3 - After each FETCH statement, the %FOUND and %NOTFOUND attributes must be tested	
		4 - If the fetch statement rasults in a new row, execute any desired processing
		5 - When completed, the CURSOR must be closed (Extremly important)

	ADVANTAGES of explicit Cursors
	- you can programmatically cycle though multiple records
	- The common EXCEPTION Which can ocur with the SELECT..INTO statements never happen
		- TOO_MANY_ROWS because of the FETCH command
		- NO_DATA_FOUND because the pointer simply stays on the last record

*/
SET SERVEROUTPUT ON;
DECLARE

	--Declare the cursor
	CURSOR Employees IS
	  SELECT *
	  FROM employee;	


	--Declare the row type asocciated to the cursor
	EmpRecords employee%ROWTYPE;

BEGIN

	--Open the cursor
	OPEN Employees;

	--Begin the indefinite loop
	LOOP
		--Retrieve the cursor data into the holding object
		FETCH Employees INTO EmpRecords;
	
		--Test whether a record was founf
		EXIT WHEN Employees%NOTFOUND;

		--Display the record detail
		DBMS_OUTPUT.PUT_LINE('Employees ' || EmpRecords.LName || ' earns ' || EmpRecords.salary);
	
	END LOOP;
		

	--CLOSE THE CURSOR
	CLOSE Employees;

END;
/