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
		INDEFINITE LOOPS
		- execute indefinitely inil wither an exception occurs or the EXIT
		  Statement is issued
		-the beginning and ending statements are LOOP...END LOOP
*/
SET SERVEROUTPUT ON;
DECLARE
	CONT	NUMBER(2) := 1;
BEGIN
	
	LOOP
	DBMS_OUTPUT.PUT_LINE('CONTADOR = ' || CONT);
	EXIT WHEN cont = 10;
	CONT := CONT + 1;
	END LOOP;	


END;
/