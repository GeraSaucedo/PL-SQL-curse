--------------------------------------------------------------------------
--			INDENTIFY EXCEPTIONS DETAIL 			--
--------------------------------------------------------------------------
/*
it's essential to understand the diferent exceptions and their root causes
THE FOLLOWING IS A PARTIAL LIST OF THE MOST COMMON EXCEPTIONS NAMES YOU ARE
LIKELY TO USE:


	Exception name:		Operation
	NO_DATA_FOUND		SELECT...INTO
	TOO_MANY_ROWS

	CURSOS_ALREADY_OPEN	Explicit cursors
	INVALID_CURSOR	

	CASE_NOT_FOUND		Missing match or ELSE clause in case structures

	INVALID_NUMBER		Value errors when assigning values to variables
	VALUE_ERROR	
	ZERO_DIVIDE

	LOGIN_DENIED		Database connect errors
	NOT_LOGGED_ON		

	PROGRAM_ERROR		Internal fatal errors
	STORAGE_ERROR
	TIMEOUT_ON_RESOURCE

ISOLATING THE SPECIFIC EXCEPTION
	- When errors don't have a name, you can define your own using the EXCEPTION_INIT
	- if the error has no system user-defined name, the build-in functions SQLCODE
	  and SQLERRM will reveal he nature of the exception


*/

