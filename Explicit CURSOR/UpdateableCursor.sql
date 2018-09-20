--------------------------------------------------------------------------
-- 			      UPDATEABLE CURSORS			--
--------------------------------------------------------------------------
/*
	EXTENDED CURSOR TECHNIQUES
	Beyond the basic cursor technique discussed so far, there are 
	additional techniques which are important for you to understand.
	
	These techniques are:
	- Declaring using updateable cursors

	AS part of the row-by-row processing, updates may need to be peformed
	
	This is done by incorporating the FOR UPDATE OF clause

	CRITICAL NOTES FOR UPDATE CURSOR:
	- Once an UPDATE cursor is opened, the underlying data is locked
	- These rows will remain locked until:
		- The cursor is closed
		- The transaction is terminated with either COMMIT or ROLLBACK

	WHERE CURRENT OF clause:
	When working with updatable cursors, you will need to use a SQL DML update 
	command to physically perform the update.

	You must include the phrase:
		WHERE CURRENT OF CursorName
*/
SET SERVEROUTPUT ON;
DECLARE

	--Declare the cursor
	CURSOR Employees IS
		SELECT *
		FROM employee
	FOR UPDATE OF Salary;

	--Declare the row type associated to the CURSOR
	EmpRecords 	employee%ROWTYPE;

	OldSalary 	NUMBER(5);
	NewSalary	NUMBER(5);
	
BEGIN
	--Open the cursor
	IF NOT (Employees%ISOPEN) THEN
		OPEN Employees;
	END IF;

	--Begin the indefinite loop
	LOOP
		FETCH Employees INTO EmpRecords;

		EXIT WHEN Employees%NOTFOUND;

		OldSalary := EmpRecords.Salary;
		
		IF EmpRecords.Salary > 50000 THEN
			NewSalary := OldSalary - 10000;
			
			UPDATE Employee SET Salary=NewSalary
			WHERE CURRENT OF Employees;

			DBMS_OUTPUT.PUT_LINE(EmpRecords.LName || ' New salary is ' || NewSalary ||
						' Old salary was: ' || OldSalary);
		END IF;

	END LOOP;

	IF (Employees%ISOPEN) THEN
		CLOSE Employees;
	END IF;

END;
/