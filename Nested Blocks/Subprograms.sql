--------------------------------------------------------------------------
--			 	 SUBPROGRAMS				--
--------------------------------------------------------------------------
/*
	How they differ from Nested Blocks
	
	SUBPROGRAM:
		The concept of a subprogram is common with any program enviroment
		- it is the method of making your programs modular.
		- Subprograms may be wither a Procedure or Function
	
		Procedure: Performs an action
		Function: May perform an action, but its primary purpose is to 
			  return a value
	
	DISTINCTION WITH NESTED BLOCKS
		Subprograms are similar to NestedBlocks, but the differences are 
		importan to understand
		
		Similarities:
			- Subprograms are defined within an existing PL/SQL program
		
		Differences:
			- Sub programs are defined in the DECLARE clause whereas 
			  Nested Blocks are defined in the BEGIN or EXCEPTION clause
			- Subprograms Execute when they are called within the execution
			  portion of the outer program


	DISTINCTION WITH STORED PROGRAM UNITS
		Subprograms are more similar to stored Program Units than Nested Blocks, 
		but there is one important differece

		Similarities:
			- Subprogram syntax, declaration rules, and other details
			  are practically identical
	
		Differences:
			- Stored programs units are independient programs physically 
			  stored on the database server
			- Since stored program unit is stored on the database server
			  , performance is greatly improved
			
	
	SUBPROGRAM SYNTAX
		The followin rules must be followed when creatin Subprograms:
			- When declaring a subprogram, you use the following format

				PROCEDURE name (parameter type)

			- Parameter types must be unconstrained(no size)
			- There is no explicit DECLARE clause, Declaration are made
			  immediately following the IS clause.
			- The END statemet must reference the subprogram name
		
*/
SET SERVEROUTPUT ON;
DECLARE

	EmpLName 	Employee.LName%TYPE;
	EmpSSN		Employee.ssn%TYPE := '&Enter_empmloyee_ssn';

	PROCEDURE Display (Message VARCHAR2) IS
		
		TempMessage	VARCHAR2(80);

		BEGIN
	
			IF LENGTH(Message) > 40 THEN

				TempMessage := SUBSTR(Message, 1, 40);

			ELSE

				TempMessage := 'Message generated on ' ||
						TO_cHAR(SYSDATE, 'fmDAY') || ': ' ||
						UPPER(Message);	

			END IF;

			DBMS_OUTPUT.PUT_LINE(TempMessage);

		END Display;


		BEGIN

			SELECT LName
			INTO EmpLName
			FROM Employee
			WHERE ssn = EmpSSN;			

			Display('Employee ' || EmpSSN || ' is ' || EmpLName);
			

			EXCEPTION 
				WHEN too_many_rows OR no_data_found THEN Display ('Database error');
				WHEN OTHERS THEN Display('unknown error');

		END;
/

