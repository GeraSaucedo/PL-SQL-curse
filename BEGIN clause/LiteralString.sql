/*---------------HANDLING STRING LITERALS-----------------
One common problems is the conflic between the use of certain characters as symbols

if you write Msg  := 'The value isn't valid' oracle just read "The value isn"
for resolve this you need use the string literal q'!...!' 
 
it says oracle that take all the text between the caracters '! !'

Check the example:

*/
SET SERVEROUTPUT ON;
DECLARE

	--Declare variables
	nValue		NUMBER(20) := &enter_value;
	vMessage	VARCHAR(30);

BEGIN

	--Test the value entered by the user
	IF nValue > 60000 THEN
		--set and display the message
		--vMessage := 'the value isn't valid.';
		vMessage := q'! the value isn't valid. !';
		DBMS_OUTPUT.PUT_LINE(vMessage);
	END IF;

END;
/
