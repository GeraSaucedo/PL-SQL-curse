/*------------DECLARING USER-DEFINED TYPES---------------
	Complex user-defined types may be defined which nest 
	several levels within a hierarchy.
	
	- For example, an employee bonus might be more than just payment of a sum of money
		- cash paymenr
		- use of companyy car
		- Extra vacation weeks

*/

SET SERVEROUTPUT ON;

DECLARE
	
	--Simple type declaration
	TYPE BonusCompensation
	  IS RECORD	(	CashPayment 	NUMBER(6),
				CompanyCar 	BOOLEAN,
				VacationWeeks	NUMBER(2)
			);

	--Extended type declaration
	TYPE EmpRecord
	  IS RECORD	(	ssn 		employee.ssn%TYPE,
				LName		employee.LName%TYPE,
				DName		department.DName%TYPE,
				BonusPayment 	BonusCompensation
			);

	--Another extended type declaration along with the instance declarated
	TYPE ManagerRecord
	  IS RECORD	(	ssn		employee.ssn%TYPE,
				BonusPayment	BonusCompensation
			);

	--Instace declaration
	BestEmp 	EmpRecord;
	BestManager	ManagerRecord;

BEGIN

	/*
	Less thann meaninful logic to determine the employee who should receive a bonus.
	The main focus in this example is the ability to store a database values within the record instance
	*/

	SELECT essn, LName, DName
	INTO 	BestEmp.ssn, BestEmp.LName, BestEmp.DName
	FROM 	Employee, department, works_on
	WHERE	Employee.dno = department.dnumber
	AND	Employee.ssn = works_on.essn
	AND Hours = (SELECT MAX(hours) FROM works_on)
	AND ROWNUM <= 1;

	--The next segment of code accesses the vales within the record instance
	BestEmp.BonusPayment.CashPayment := 5000;
	BestEmp.BonusPayment.CompanyCar := TRUE;
	BestEmp.BonusPayment.VacationWeeks := 1;

	--OUTPUT THE RESULTS
	DBMS_OUTPUT.PUT_LINE('Best employee name: ' || BestEmp.LName);
	DBMS_OUTPUT.PUT_LINE('Best employee department: ' || BestEmp.DName);
	DBMS_OUTPUT.PUT_LINE('Best employee bonus payment:  ' || BestEmp.BonusPayment.CashPayment);
	
	
	--Test for company car
	IF BestEmp.BonusPayment.CompanyCar = TRUE THEN
		DBMS_OUTPUT.PUT_LINE('Company Car also provided');
	END IF;

	--Test for vacation weeks
	IF BestEmp.BonusPayment.VacationWeeks > 0 THEN
		DBMS_OUTPUT.PUT_LINE('Extra vacation weeks granted: ' || BestEmp.BonusPayment.VacationWeeks);
	END IF;


	/*
	A similar set of intructions uses the other record instance
	*/
	SELECT ssn
	INTO BestManager.ssn
	FROM Employee, department
	WHERE employee.ssn = department.MgrSSN
	AND ROWNUM <= 1;

	--The next segment accesses the values within the record instance
	BestManager.BonusPayment.CashPayment := 10000;
	BestManager.BonusPayment.CompanyCar := TRUE;
	BestManager.BonusPayment.VacationWeeks := 2;

	--Output the result
	DBMS_OUTPUT.PUT_LINE(chr(13)); --Salto de linea 
	DBMS_OUTPUT.PUT_LINE('Best manager SSN: ' || BestManager.ssn);
	DBMS_OUTPUT.PUT_LINE('Best manager bonus payment: $' || BestManager.BonusPayment.CashPayment);

	--Test for company car
	IF BestManager.BonusPayment.CompanyCar = TRUE THEN
		DBMS_OUTPUT.PUT_LINE('Company Car also provided');
	END IF;

	--Test for vacation weeks
	IF BestManager.BonusPayment.VacationWeeks > 0 THEN
		DBMS_OUTPUT.PUT_LINE('Extra vacation weeks granted: ' || BestManager.BonusPayment.VacationWeeks);
	END IF;

END;
/