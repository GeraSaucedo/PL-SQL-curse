/*
	Working with numeric variables

*/
DECLARE
		
	--Declare variables
	EmpSalary	employee.Salary%TYPE;
	EmpRaisePct 	NUMBER(2);


BEGIN

	--Set the variables
	EmpSalary := &enter_salary;
	EmpRaisePct := &enter_raise_pct;

	--Display the starting salary
	DBMS_OUTPUT.PUT_LINE('Current salary: ' || EmpSalary);

	--Calculate the new salary
	EmpSalary := EmpSalary + (EmpSalary * (EmpRaisePct / 100));

	--Display the results
	DBMS_OUTPUT.PUT_LINE('New Salary: ' || EmpSalary);

END;
/