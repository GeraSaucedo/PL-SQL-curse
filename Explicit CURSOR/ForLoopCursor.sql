--------------------------------------------------------------------------
-- 			      FOR...LOOP CURSORS			--
--------------------------------------------------------------------------
/*
	The FOR..LOOP Cursor is a very effective techinque that greatly impmroves
	performance.

	- Simplifies the code
	- More concise
	- Manages Cursor Opening and Closing
	- Manage EXIT
	- FETCH is automatic
	
*/
SET SERVEROUTPUT ON;
BEGIN

	--Create FOR LOOP cursor
	FOR EmpCurs IN 
		(	SELECT * 
			FROM Employee)
	LOOP

		DBMS_OUTPUT.PUT_LINE('Employee found: ' || EmpCurs.FName ||
					' ' || EmpCurs.LName );		

	END LOOP;

END;
/