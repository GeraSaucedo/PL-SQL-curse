/* Object names rules:
  - Maximum length is 30 Characters.
  - The first character must be a letter
  - ilegal characters: $, - (dash), / , (space)
  - legal characters: $, #, _ (underscore)
  - it can not be named same as reserved word */ 

--Set the server to output the results
SET SERVEROUTPUT ON;

DECLARE

	--Declare variables
	vNumber	NUMBER(4);
	vChar	CHAR(10);

BEGIN

	--Tell the user that everything is working
	DBMS_OUTPUT.PUT_LINE('Compiled declarations successfully');

END;
/