--------------------------------------------------------------------------
-- 				IF-THEN-ELSE 				--
--------------------------------------------------------------------------
/*
	- Are typical of most programming languages
	- They are used to evaluate conditions where the numer of cases is limited
*/	
SET SERVEROUTPUT ON;
DECLARE
	value Number(2);
BEGIN
	value := &Enter_value;
	
	IF value > 10 THEN
		DBMS_OUTPUT.PUT_LINE('THE VALUE IS HIGHER THAN 10');
	ELSE
		DBMS_OUTPUT.PUT_LINE('THE VALUE IS NOT HIGHER THAN 10');
	END IF;
END;
/
