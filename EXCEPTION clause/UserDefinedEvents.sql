--------------------------------------------------------------------------
--		 	 USER-DEFINING EVENTS				--
--------------------------------------------------------------------------
/*
	User-defined events are not internal errors.
	However, they are an effective way to create business rules for your programs.
	Steps to create an events as an exception

	Step to create an events as an exception:
	- Whitin DECLARE, assign a name to EXCEPTION
	- Within BEGIN, create a condition to RAISE the EXCEPTION
	- Within EXCEPTION, handle the exception as desired
*/
DECLARE

	--Declare exceptions
	TooMuchMoney 	EXCEPTION;
	TooLittleMoney	EXCEPTION;

BEGIN

	IF &Salary <= 20000 THEN
		RAISE TooLittleMoney;
	ELSE
		RAISE TooMuchMoney;
	END IF;

	EXCEPTION 
	   WHEN TooLittleMoney THEN
		DBMS_OUTPUT.PUT_LINE('No raise attempted. salary too LOW.');
	 
	   WHEN TooMuchMoney THEN
		DBMS_OUTPUT.PUT_LINE('Raise attempted. salary too HIGH.');
	
		
END;
/