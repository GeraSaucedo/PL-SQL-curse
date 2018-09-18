----------------------------------------------------------
--		SQL DML WITHIN PL/SQL			--
----------------------------------------------------------
/*	Any valid SQL DML update or transaction control 
	statement may be directly execute in PL/SQL
	
	DML Update statement:
	- INSERT
	- UPDATE
	- DELETE
 	- LOCK TABLE

	TRANSACTION CONTROL STATEMENT
	- COMMIT
	- ROLLBACK
	- SAVEPOINT
	- SET TRANSACTION
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
/*
Identify the one employee who has been the least active, based upon the number
of hours they been working o projects. This will be the first employees
we want to remove from the existing COMPANY and transfer them into the new division
*/

	--Retrive the first employee
	SELECT essn, LName, DName, 0
	INTO InactiveEmp
	FROM Employee emp
	   INNER JOIN department dep ON emp.dno = dep.dnumber
	   INNER JOIN works_on wo ON emp.ssn = wo.essn
	WHERE Hours = (SELECT MIN(hours) FROM Works_on)
	   AND ROWNUM <= 1; 	

	--Remove this employee as a manager of any department
	UPDATE department
	SET MgrSSN = NULL
	WHERE MgrSSN = InactiveEmp.ssn;

	--Remove this employee asa supervisor of other employees
	UPDATE employee
	SET supersSN = NULL
	WHERE SuperSSN = InactiveEmp.ssn;

	--Delete any dependents and all works rows
	DELETE FROM dependent 
	WHERE essn = InactiveEmp.ssn;

	DELETE FROM works_on 
	WHERE essn = InactiveEmp.ssn;

	--Delete this employee from the employee table itself
	DELETE FROM employee 
	WHERE ssn = InactiveEmp.ssn;

	--Transaction control statement to commplete the  transaction
	COMMIT;

	--Ouptut the detail to the user
	DBMS_OUTPUT.PUT_LINE('Least active employee has been transfered: ' || InactiveEmp.LName);

END;
/