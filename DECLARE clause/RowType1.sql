/*----------------%ROWTYPE RECORD------------
	%ROWTYPE is a complex type that defines a record matching 
	the names and data types of a entire table or view
*/
SET SERVEROUTPUT ON;

DECLARE
	
	--Declare variable
	rowEmp1 	Employee%ROWTYPE;
	rowEmp2		Employee%ROWTYPE;

BEGIN

	--Fill the fields
	rowEmp1.lname := 'Saucedo';
	rowEmp1.fname := 'Gerardo';

	rowEmp2.lname := 'Saucedo';
	rowEmp2.fname := 'Jesus';

	--Output one of the records
	DBMS_OUTPUT.PUT_LINE('Row 1 is ' || rowEmp1.lname || ', ' || rowEmp1.fname);

END;
/