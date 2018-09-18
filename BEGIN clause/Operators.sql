----------------------------------------------------------
--		    COMPARISON OPERATORS		--
----------------------------------------------------------
/*
	
	
*/
SET SERVEROUTPUT ON;
DECLARE
	--Declare variables
	VString		VARCHAR2(10) := 'Doe';
	vMessage 	VARCHAR2(30);
BEGIN

	--Test the string
	IF vString = 'Doe'
	OR vString != 'Doe'
	OR vString IS NOT NULL
	OR vString LIKE 'D%'
	OR vString IN ('Doe', 'Smith', 'Jones')
	OR vString BETWEEN 'Daa' AND 'Dzz' --NICEEEEEEE
	THEN

	   --Set the message
	   vMessage := 'String properly evaluated';

           --Display the message to the user
	   DBMS_OUTPUT.PUT_LINE(vMessage);	


	END IF;

END;
/