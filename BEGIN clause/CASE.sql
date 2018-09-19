--------------------------------------------------------------------------
-- 				CASE					--
--------------------------------------------------------------------------
/*
	As an alternative to IF-THEN-ELSE statement for complex logic structures, 
	PL/QL offers a CASE statement
	
	- its prefect when many conditions are requiered

	The case statement has multiplefoms:
		- Selector: this is a when a single expression is evaluated
		- Searched: this is where a series of commplex conditions are searched

	- once a condition has been selected, the remaining conditions are not evaluated
	- if non of the conditions are met, the ELSE clause is executes
	- if non of the condition are met and ELSE clause is not specified, the 
	  CASE_NOT_FOUND EXCEPTION is raised

*/
SET SERVEROUTPUT ON;
DECLARE
	value NUMBER(2);
	message VARCHAR2(50);
BEGIN
	value := &enter_value;
	
	CASE value
	WHEN 1 THEN message := 'Value = 1';
	WHEN 2 THEN message := 'Value = 2';
	WHEN 3 THEN message := 'Value = 3';
	ELSE message := 'Value is not in the when cases';
	END CASE;

	DBMS_OUTPUT.PUT_LINE(message);

	value := &enter_another_value;
	
	CASE
	WHEN value < 10 THEN message := 'Value is NOT higher than 10';
	WHEN value > 10 THEN message := 'Value is higher than 10';
	END CASE;
	
	DBMS_OUTPUT.PUT_LINE(message);
	


	
END;
/