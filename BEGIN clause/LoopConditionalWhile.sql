--------------------------------------------------------------------------
-- 			CONDITIONAL LOOPS				--
--------------------------------------------------------------------------
/*
	- Conditional loops execute indefinitely while a given condition is TRUE
	- Generally this loop is used when the loop logic changes the conditional
	expression
*/
SET SERVEROUTPUT ON;
DECLARE
	Cont 	NUMBER(2) := 0;
BEGIN
	WHILE Cont < 10 LOOP
		DBMS_OUTPUT.PUT_LINE('Cont = ' || Cont);
		Cont := cont + 1;
	END LOOP;
END;
/