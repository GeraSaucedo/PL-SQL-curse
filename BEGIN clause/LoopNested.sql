--------------------------------------------------------------------------
--				NESTED LOOPS				--
--------------------------------------------------------------------------
/*
	FOR Highlt complex logic problems it may be necessary to have several 
	levels of nested loops
	
	Nested loops are ideal when working with hierarchies

	[1,1][1,2][1,3]
	[2,1][2,2][2,3]
	[3,1][3,2][3,3]
	
*/
--SET SERVEROUTPUT ON;
DECLARE
	Col	 	NUMBER(2) := 3;
	row		NUMBER(2) := 3;
BEGIN
	FOR i IN 1..col LOOP
		FOR j IN 1..row LOOP
			DBMS_OUTPUT.PUT_LINE('POSITION: [' || i || ',' || j || ']');
		END LOOP;
	END LOOP;
END;
/

