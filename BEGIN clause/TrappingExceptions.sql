--------------------------------------------------------------------------
--			TRAPPING EXCEPTIONS 				--
--------------------------------------------------------------------------
/*
	- Exception handlers are declared using the WHEN statement
	- There are a few different options for routine exceptions
	  into their respective exception logic
	
	There are several techniques we will consider:
	Exceptions:
	- Single: This is a program which should execute only when the 
		  particular exception if fired
	- Set:	Using PL/SQL conditional logic you can handle severe 
		exceptinos with the same logic
	- Global Handler: This is Where you use the WHEN OTHERS test

*/

	EXCEPTION
	WHEN zero_divide THEN
	WHEN no_data_found OR too_many_rows THEN
	WHEN OTHERS THEN
