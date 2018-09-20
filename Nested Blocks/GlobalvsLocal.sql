--------------------------------------------------------------------------
--			  GLOBAL VS LOCAL OBJECTS			--
--------------------------------------------------------------------------
/*
	
	When using Nested blocks, the declare objects within the different 
	block become either global or local

	Global: Any object declared in the outer block are global
	Local:	Any declaration made within the inner Block are local and 
		only visible to the inner block

	Object names may be reused as local objects within inner blocks.

		BlockName.ObjectName
	
*/
--------------------------------------------------------------------------
--			  GLOBAL VS LOCAL EXCEPTIONS			--
--------------------------------------------------------------------------
/*
	There is also the concept of both global and local Exception 
	- All exception are considered local
	- The system looks for the EXCEPTION clause within that block
	- if no EXCEPTION clause is found, the system branches to the outer block
	- if no EXCEPTION clause is foun in the outermost block, the program terminates

	WHEN an EXCEPTION is handled in an inner Block, you may consider it 
	partially handnled
		- You can use the RAISE statement to branch the eception in the manner you wish

*/	

SET SERVEROUTPUT ON;
<<MainBlock>>
DECLARE
	
	--Declare the row type associated to the cursor	
	EmpRecord 		employee%ROWTYPE;
	ExceptionOcurred 	BOOLEAN := FALSE;
	NoIdea			EXCEPTION;
BEGIN

	<<SelectEmp>>
	BEGIN
		SELECT *
		INTO EmpRecord
		FROM employee
		WHERE upper(LName) = upper('&Enter_Last_Name');

		EXCEPTION
			WHEN no_data_found THEN DBMS_OUTPUT.PUT_LINE('No employee Found');
			WHEN too_many_rows THEN	DBMS_OUTPUT.PUT_LINE('Multiple employees Found');
			WHEN OTHERS THEN 	RAISE NoIdea;

	END SelectEmp;

	--Test whether an exception occurred
	IF NOT ExceptionOcurred THEN
		DBMS_OUTPUT.PUT_LINE('Salary for: ' || EmpRecord.LName ||
					' is $' || EmpRecord.Salary);
	END IF;

	EXCEPTION
	WHEN NoIdea THEN
		DBMS_OUTPUT.PUT_LINE('Error occurred within the inner block');
		DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
	
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('EXCEPTION trapped by universal handler');
		DBMS_OUTPUT.PUT_LINE('Error code: ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('Error message: ' || SQLERRM);
	
		


END MainBlock;
/










