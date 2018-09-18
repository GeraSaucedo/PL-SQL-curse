/*----------------TYPE...RECORD-----------------
	The RECORD user-defined data type allows more flexibility than %ROWTYPE

	- %ROWTYPE must matchan existing table
	- RECORD allows any combination of data types

	
	Steps to Define a RECORD
	- The user-defined record must be declared
	- Reference the user-defined type

*/
SET SERVEROUTPUT ON;

DECLARE

	TYPE EmpRecord
	  IS RECORD ( 	ssn		Employee.ssn%TYPE,
			LName 		Employee.lname%TYPE,
			DName		Department.DName%TYPE,
			BonusPayment	NUMBER(6)
		     );

	ActiveEmp 	EmpRecord;
	InactiveEmp 	EmpRecord;

BEGIN
	
	--Retrive the active employee details
	SELECT essn, LName, DName, 5000
	INTO ActiveEmp
	FROM Employee, Department, Works_on 
	WHERE employee.dno = department.dnumber
	AND employee.ssn = works_on.essn
	AND hours = (SELECT MAX(hours) FROM works_on)
	AND ROWNUM <= 1;

	--Output the results
	DBMS_OUTPUT.PUT_LINE ('Active emplyee name: ' || ActiveEmp.LName);
	DBMS_OUTPUT.PUT_LINE ('Active employee department: ' || ActiveEmp.DName);
	DBMS_OUTPUT.PUT_LINE ('Active employee bonus: $' || ActiveEmp.BonusPayment);

	--Retrive the inactive employee details
	SELECT essn, LName, DName, 0
	INTO InactiveEmp
	FROM Employee, department, works_on
	WHERE employee.dno = department.dnumber
	AND employee.ssn = works_on.essn
	AND hours = (SELECT MIN(hours) FROM works_on)
	AND ROWNUM <= 1;

	--Output the results
	DBMS_OUTPUT.PUT_LINE ('Inactive emplyee name: ' || InactiveEmp.LName);
	DBMS_OUTPUT.PUT_LINE ('Inactive employee department: ' || InactiveEmp.DName);
	DBMS_OUTPUT.PUT_LINE ('Inactive employee bonus: $' || InactiveEmp.BonusPayment);

END;
/