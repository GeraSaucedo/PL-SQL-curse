/*------------working with CHAR And VARCHAR2--------------
	PL/SQL & SQL manipulation
	- Working with character, numeric, date and boolean variables
	- Hadling special situations for string literals
	- using comparision operatos to evaluate variables
	- Using SQL Function withing program logic
	- Using Regular expressions to search character data

	CHAR AND VARCHAR2 variables

	- Assignin a value to a variable requires the assignment operator ':='
	- When manipulating values, you will use the concatenation operatod '||'

*/
SET SERVEROUTPUT ON;
DECLARE
	EmpLname	employee.lname%TYPE;
	EmpFname	employee.fname%TYPE;
	EmpFullName	VARCHAR(50);
BEGIN
	
	--Set the variables
	EmpLname := 'Saucedo';
	EmpFname := 'Jerry';

	--Compile the name
	EmpFullName := EmpLname || ', ' || EmpFname;

	--Display the name
	DBMS_OUTPUT.PUT_LINE('Employee Name: ' || EmpFullName);

END;
/