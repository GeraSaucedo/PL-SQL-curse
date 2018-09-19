--------------------------------------------------------------------------
-- 				  LOOPS					--
--------------------------------------------------------------------------
/*
	Frequently a series of program statements must be execute iteratively. 
	PL/SQL allows for this by using Loops.
	
	All Loops have the folowing basic elements:
		- a LOOP clause which defines the starting point of the loop.
		- Any number of exexution statements follow the loop.
		- The EXIT or EXIT WHEN clause allows you to abort the loop.
		- The CONTINUE or CONTINUE WHEN clause allows you to exit the 
		  current iteration of the loop.
		- An END LOOP statement terminates the loop definition

	TYPES OF LOOPS
	
		FIXED ITERATION LOOP
		- an index variable is specified and implicitly declared
		- the index increments each time the loop executes

		EX:
		FOR a IN 1..100 LOOP
			...
		END LOOP;
		-- You can use the index "a" as a value


		
	LOOP IN REVERSE 
		-A variation on the FOR...NEXT loop is to execute
		 in a reverse order
		
		EX:
		FOR a IN REVERSE 1..100 LOOP
			...
		END LOOP;
*/

SET SERVEROUTPUT ON;
DECLARE
BEGIN

	FOR i IN 1..10 LOOP
		DBMS_OUTPUT.PUT_LINE('The value of i is: ' || i);
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE(chr(13));
	DBMS_OUTPUT.PUT_LINE('Now in reverse');
	DBMS_OUTPUT.PUT_LINE(chr(13));

	FOR i IN REVERSE 1..10 LOOP
		DBMS_OUTPUT.PUT_LINE('The value of i is: ' || i);
	END LOOP;
	

END;
/

