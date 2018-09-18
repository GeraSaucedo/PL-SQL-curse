----------------------------------------------------------
--			FUNCTIONS			--
----------------------------------------------------------
/*
	Oracle SQL has many built-in Functions which 
	ay be used to modify column data	
*/
SET SERVEROUTPUT ON;
DECLARE
	--type declaration
	TYPE EmpRecord
	  IS RECORD	(	ssn 		employee.ssn%TYPE,
				LName		employee.LName%TYPE,
				DName		department.DName%TYPE,
				BonusPayment 	NUMBER(6)
			);

	--Instace declaration
	BestEmp 	EmpRecord;

BEGIN
	
	--Fill the type
	SELECT essn, LName, DName, 5000
	INTO BestEmp
	FROM employee, department, works_on
	WHERE Employee.dno = department.dnumber
	AND hours = (SELECT MAX(hours) FROM works_on)
	AND ROWNUM <= 1;

	--Display the message to the user
	DBMS_OUTPUT.PUT_LINE('Best employee name: ' || UPPER(BestEmp.LName));

	--Display the messasge to the user
	DBMS_OUTPUT.PUT_LINE('Bet employee bonus: $' || ROUND(BestEmp.BonusPayment * 1.15, -2));
END;
/

