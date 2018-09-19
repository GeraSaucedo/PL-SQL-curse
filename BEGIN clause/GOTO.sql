--------------------------------------------------------------------------
--			LOGIC CONTROL AND BRANCHING			--
--------------------------------------------------------------------------
/*
	As logic within programs becomme more complex, we need procedural
	programming structures found in most lenguages
	- Program labels and GOTO statements
	- LOOP structures
	- IF THEN ELSE structures
	- CASE structures

	PROGRAM LABELS:
	- are location markers
	- they can be placend anywhere within block
	- they are encolsed with angle brackets

	<<LabelName>>

	- Label nambes can beused for useful for the following reasons:
	- For a documentation and readability
	- a reference point for a GOTO statement
	- A reference point for nested programs

	GOTO:
	- The GOTO statement is simply a jump within program execution
	- a valid label name must be specified as the target
	- Angle brackets are used only to define the label
	- The GOTO statement simply identifies the NAME
		Exxentricities
	- Labels cannot be the last statement withi a PL/SQL program
		- include the NULL statement to avoid any issues
			(<<Conclusion>>
				NULL;  
			END;)


*/
SET SERVEROUTPUT ON;
DECLARE
	--Declare the record object
	TYPE EmpRecord
	   IS RECORD 	(
				ssn		employee.ssn%TYPE,
				LName		employee.LName%TYPE,
				DName		department.DName%TYPE,
				BonusPayment	NUMBER(6)
			);
	
	--Decare variables
	ActiveEmp 	EmpRecord;
	InactiveEmp	EmpRecord;
	
BEGIN
<<LocateActive>>
	SELECT essn, LName, DName, 5000
	INTO ActiveEmp
	FROM Employee emp
		INNER JOIN department dep ON emp.dno = dep.dnumber
		INNER JOIN works_on wo ON emp.ssn = wo.essn
	WHERE
	  	hours = (SELECT MAX(Hours) FROM works_on)
		AND ROWNUM <=1;

<<OutputActive>>
	DBMS_OUTPUT.PUT_LINE('Active employee name: ' || ActiveEmp.LName);
	DBMS_OUTPUT.PUT_LINE('Active employee department: ' || ActiveEmp.DName);
	DBMS_OUTPUT.PUT_LINE('Active employee bonus: $' || ActiveEmp.BonusPayment);
	

<<LocateInactive>>
	SELECT essn, LName, DName, 0
	INTO InactiveEmp
	FROM Employee emp
		INNER JOIN department dep ON emp.dno = dep.dnumber
		INNER JOIN works_on wo ON emp.ssn = wo.essn
	WHERE
	  	hours = (SELECT MIN(Hours) FROM works_on)
		AND ROWNUM <=1;	

	--TEST whether the active and inactive individual are the same
	IF ActiveEmp.ssn = InactiveEmp.ssn THEN
		GOTO Conclusion;
	END IF;
	

<<OutputInactive>>
	DBMS_OUTPUT.PUT_LINE(chr(13));
	DBMS_OUTPUT.PUT_LINE('Active employee name: ' || inactiveEmp.LName);
	DBMS_OUTPUT.PUT_LINE('Active employee department: ' || InactiveEmp.DName);
	DBMS_OUTPUT.PUT_LINE('Active employee bonus: $' || InactiveEmp.BonusPayment);

<<Conclusion>>
 	NULL;

END;
/