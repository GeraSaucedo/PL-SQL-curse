--------------------------------------------------------------------------
--			USING SQLCODE AND SQLERRM			--
--------------------------------------------------------------------------
/*
IF YOUr EXCEPTION block uses the WHEN OTHERS handler, you can use the following 
objects to ascetain the problem:
- SQLCODE: Returns the exceptioncode
- SQLERRM: Returns the ereror message

By evaluating these objects, you can make your PL/SQL progra smarter
*/
ALTER TABLE employee
MODIFY (LName NOT NULL);


SET SERVEROUTPUT ON;
DECLARE
BEGIN

	UPDATE employee
	SET lname = NULL;

	EXCEPTION
	   WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('ERROR CODE: ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('ERROR MESSAGE: ' || SQLERRM);
		

END;
/
