------------------------------------------------------------------
--			USING SELECT				--
------------------------------------------------------------------
/*
	- Single-Row SELECT statements are nearly identical to all 
	  other context (it uses the INTO statement)
	- Multiple-Row SELECT statements require explicit cursors
*/
SET SERVEROUTPUT ON;
DECLARE

	--Declare RECORD object
	TYPE EmpRecord
	   IS RECORD 	( 	ssn		employee.ssn%TYPE,
				LName		employee.LName%TYPE,
				DName		department.DName%TYPE,
				BonusPayment	NUMBER(6)
			);

	--Define the variable
	InactiveEmp EmpRecord;
BEGIN

	SELECT essn, LName, DName, 0 	--The columns in the select statments must be the same
	INTO InactiveEmp		-- as the Inactive emp record
	FROM Employee emp
	   INNER JOIN department dep ON emp.dno = dep.dnumber
	   INNER JOIN works_on wo ON emp.ssn = wo.essn
	WHERE Hours = (SELECT MIN(hours) FROM Works_on)
	   AND ROWNUM <= 1; 	

	DBMS_OUTPUT.PUT_LINE(InactiveEmp.ssn || ', ' || InactiveEmp.LName);

END;
/
