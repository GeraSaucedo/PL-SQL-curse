--------------------------------------------------------------------------
-- 	   		  EXCEPTION & ENBEDDED SQL			--
--------------------------------------------------------------------------
/*
	When ceating a SELECT...INTO statement,you must ensure that it 
	returns a single row.
	- That is the reason dor the ROWNUM <= 1 criteria.

	if more than one row where returned, then the
	TOO_MANY_ROWS exception would have returned

	-----ERRORS---
	- NO_DATA_RETURNED: converserly if a select into statement does not return any rows
	
	Using summary functions eliminare the chances of an exception
	- They always return a single row
	- Even if no data is found they return value of 0 or NULL

	
	DML UPDATE STATEMENTS have no restrictions
	- Whether they apply to one row, many rows, or no rows at all,
	  no exception are throwed

	SEE RUNTIME ERROR AND COMPILE TIME ERROR

*/
SET SERVEROUTPUT ON;
DECLARE

	--Declare variables
	vSSN 		employee.ssn%TYPE;
	ExceptionName 	EXCEPTION;
				
BEGIN
	
	--Select
	SELECT ssn
	INTO vSSN
	FROM Employee
	WHERE ssn = &enter_ssn;


	--We can throw our own exception
	IF 1=1 THEN
		RAISE ExceptionName;
	END IF;

	--Display the result
	DBMS_OUTPUT.PUT_LINE('i found ' || vSSN);

	EXCEPTION
	WHEN no_data_found THEN
		DBMS_OUTPUT.PUT_LINE('SSN NOT FOUND');
	WHEN ExceptionName THEN
		DBMS_OUTPUT.PUT_LINE('MY OWN EXCEPTION WAS THROWED');
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE('UNKNOWN ERROR');


END;
/