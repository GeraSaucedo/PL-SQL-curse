--NOT WORKING CHECK THIS TOPIC
--------------------------------------------------------------------------
--			USER-DEFINED EXCEPTIONS 			--
--------------------------------------------------------------------------
/*
Many database errors may ocurr that are not within the pre-defined table
outlined earlier.
	
These must be handled with the global WHEN OTHERS test.

Instead of using the global error handler, we can issue a compiler directive
(PRAGMA) for any Oracle database error (EXCEPTION_INIT).

PRAGMA EXCEPTION_INIT:
	FOR CREATE A NEW EXCEPTION IS A 2-STEP PROCESS:
	- Declare a user-assigned name as EXCEPTION
	- Associate the name with an Oracle error number using the 
	  PRAGMA EXCEPTION_INIT command

*/
SET SERVEROUTPUT ON;
DECLARE
	--User-assigned exception name declaration
	InvalidIdentifier EXCEPTION; 
	

	--Equate the new exception name to the corresponding 
	--Oracle error member
	PRAGMA EXCEPTION_INIT(InvalidIdentifier, -904);
	
	
	value2 NUMBER(3);

BEGIN

	SELECT count(*) INTO Value2 FROM employee 
	WHERE ssn = ertf;
	
	EXCEPTION
	WHEN InvalidIdentifier THEN DBMS_OUTPUT.PUT_LINE('ERROR INVALID IDENT');
	WHEN OTHERS THEN  DBMS_OUTPUT.PUT_LINE('ERROR OTHERS');
	
	

END;
/


