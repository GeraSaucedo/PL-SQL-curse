/*
	USING BOOLEAN VARIABLES
*/
SET SERVEROUTPUT ON;
DECLARE

	--Declare variables
	EmpSalary 	Employee.salary%TYPE;
	HighPaid	Boolean := FALSE;
	
BEGIN

	--Set variables values
	EmpSalary := &enter_salary_amount;
	HighPaid := (EmpSalary > 40000);


	--Test the highPaid result	
	IF HighPaid THEN

		--Display the message to the user
		DBMS_OUTPUT.PUT_LINE('Yes, this salary is High');

	ELSE
		
		--Display the message to the user
		DBMS_OUTPUT.PUT_LINE('No, this salary is fine');
	

	END IF;	

END;
/