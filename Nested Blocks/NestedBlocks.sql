--------------------------------------------------------------------------
--				NESTED BLOCKS				--
--------------------------------------------------------------------------
/*
	WHAT ARE NESTED BLOCKS?
	As the size and complexity of your programs increase, a more 
	advanced way of organizing the code becomes essential.

	- A Nested Block is a complete PL/SQL program block enclosed
	  within the BEGIN section of another block

	WHY USE NESTED BLOCKS?
	- Nested Blocks are helpful in encolsing SELECT or other
	  Statements thet may generate an exception
		- If an Exception occurs, it is handled by the inner block 
		- Processing may continue in the outer Block
	
	RULES FOR NESTED BLOCKS:
 	- There are specific rules associated to Nested blocks
		- The boundaries of inner and outer blocks are identified using 
		  labels and the END statement
		- A maximum of 200 Nested blocks may be created
		- Nested blocks may NOT being within the DECLARE clause of the 
		  enclosing block
		- A nested Block may only begin within the BEGIN or EXCEPTION 
		  clause of the enclosing block

*/

SET SERVEROUTPUT ON;
BEGIN

	dbms_output.put_line('In the main block.');

	BEGIN
   
		dbms_output.put_line('In a nested block.');

		BEGIN
			
			dbms_output.put_line('In a nested block.');
	
		END;	
   
	END;
   
END;
/

