/*--------------DECLARE SIMPLE TYPES-------------------
	In additon to declarea variable with the 
	name and type, other options exist
	- Setting the default value
	- Ensuring the variable are NOT NULL
	- Declarin a CONSTANT value

	Setting the default value
	- When setting a value to a variable you must
	  use the assignment ':=' operator
	- If an assignment is not mad, variable will 
	  default to NULL
*/
--Ok
SET SERVEROUTPUT ON;

DECLARE
	--Definitions are the same
	nSalary		NUMBER(6) DEFAULT 25000;
	cSSN		CHAR(11) := '111-22-3333';
	vFName		VARCHAR(15) := 'Jerry';
	
	--Declare not null variables
	nDefaultDNO	NUMBER(2) NOT NULL := 10;
	vLName		VARCHAR(15) NOT NULL := 'Saucedo';
	
	
	--Declare constants (they cannot be changed)
	cMinSalary	CONSTANT NUMBER(6) := 15000;
	cMaxSalary	CONSTANT NUMBER(6) := 99000;
BEGIN
	--Print
	DBMS_OUTPUT.PUT_LINE('Name:	 ' || vFName || ' ' || vLName );
	DBMS_OUTPUT.PUT_LINE('SSN:	 ' || cSSN );
	DBMS_OUTPUT.PUT_LINE('Salary:  	$' || nSalary );
	DBMS_OUTPUT.PUT_LINE(' ');
	DBMS_OUTPUT.PUT_LINE('Minimum: 	$' || cMinSalary);
	DBMS_OUTPUT.PUT_LINE('Maximum:	$' || cMaxSalary);
END;
/