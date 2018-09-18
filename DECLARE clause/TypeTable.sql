/*-------------TYPE...TABLE------------
	TABLE type are used to create single dimensional tables
	these are useful when storing arrays of values retrueved from the database

	Steps to define a table:
	- The ser-defined table must be declared
	- reference the user-defined type
*/

SET SERVEROUTPUT ON;
DECLARE

	--Declare variables
	TYPE EmpSSNarray
	   IS TABLE of employee.ssn%TYPE
	   INDEX BY SIMPLE_INTEGER;

	--Declare variables using the table
	ManagementList		EmpSSNarray;
	WorkerList		EmpSSNarray;

BEGIN 

	--Retrieve the first supervisor
	SELECT superssn
	INTO ManagementList(1)
	FROM employee
	WHERE superssn IS NOT NULL
	AND ROWNUM <= 1;

	--Retrieve the second supervisor
	SELECT superssn
	INTO ManagementList(2)
	FROM employee
	WHERE superssn IS NOT NULL
	AND ROWNUM <= 1
	AND superssn <> ManagementList(1);

	--Retrieve the first Worker
	SELECT essn
	INTO WorkerList(1)
	FROM works_on
	WHERE hours IS NOT NULL
	AND ROWNUM <= 1
	AND essn NOT IN(ManagementList(1), ManagementList(2));

	--Retrieve the second Worker
	SELECT essn
	INTO WorkerList(2)
	FROM works_on
	WHERE hours IS NOT NULL
	AND ROWNUM <= 1
	AND essn NOT IN(ManagementList(1), ManagementList(2), WorkerList(1));

	--OUTPUT the results
	DBMS_OUTPUT.PUT_LINE('Manager are: ' || ManagementList(1) || ', ' || ManagementList(2));
	DBMS_OUTPUT.PUT_LINE('Workers are: ' || WorkerList(1) || ', ' || WorkerList(2));	
	
END;
/