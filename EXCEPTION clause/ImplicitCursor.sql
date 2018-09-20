--------------------------------------------------------------------------
--				IMPLICIT CURSOR				--
--------------------------------------------------------------------------
/*
	EACH time a SQL DML statement is executed within PL/SQL,
	Oracle automatically create an internal work area known as a
	SQL cursor

	SQL cursor object details
	- We can access attributes within this cursos to determine the 
	  action results.
	- The cursos and attributes are available regardless of a 
	  sucessful or failed DML operation.

	IMPLICIT CURSOR ATTRIBUTES:

	Attribute	type	Explanation

	SQL%FOUND	T/F	Determines whether the DML statement affected any rows
				if a dml statment throws results SQL%FOUND return true
	
	SQL%NOTFOUND	T/F	Logical opposite of the SQL%FOUND attribute
	
	SQL%ROWCOUNT 	int	Equals thenumber of rows affected by the DML statement
	
	SQL%ISOPEN	T/F	Indicates whether or not the cursor is currently open



	SQL%ROW & SELECT...INTO
	For single-row SELECT..INTO statements, the attribute values differ somewhat 
	from DML update statements
	- SQL%ROWCOUNT return 0 when no rows were fetched and the NO_DATA_FOUND
	  exception was raised
	- SQL%ROWCOUNT return 1 when the statement returned one and only one row
	  No exceptions generated
	- SQL%ROWCOUNT return 1 when the statement returnedn too many rows and the
	  TOO_MANY_ROWS exception was raised
*/
SET SERVEROUTPUT ON;
DECLARE
BEGIN	
	UPDATE employee 
	SET SuperSSN = NULL
	WHERE SuperSSN = 111111111;

	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Employees removed as supervisor: ' || SQL%ROWCOUNT);
	ELSE
		DBMS_OUTPUT.PUT_LINE('Not Employees was removed as supervisor: ' || SQL%ROWCOUNT);
	END IF;

END;
/


