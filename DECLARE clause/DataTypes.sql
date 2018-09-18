/* AVAILABLE DATA TYPES:

     INTEGER data types (only allow whole numbers)
	- BINARY_INTEGER or PLS_INTEGER	(More efficient than number)
	- SIMPLE_INTEGER 		(only available in orale 11g and  later)

	Integer data Subtype
		- NATURAL	(range of 0 to 2G)
		- POSITIVE	(range of 1 to 2G)

     FLOATING POINT DATA TYPES
	- BINARY_FLOAT 		(for 32-bit single precision float, also suports infinity and NaN)
	- BINARY_DOUBLE		(for 64-bit double precision, perfect for scientific computing applications)
	- NUMBER		(precision 1 to 38 scale, operate slower than the others type)


     CHARACTER DATA TYPES
	- CHAR(n)		(Fixed length character data from 1 to 32,767)
	- VARCHAR(n)		(can adjust itself based upon how much text you ut in there whereas)

     PREDEFINED DATA TYPES
	- ROWID (obsolete)	(identifies a physucal row in a table)	
	- UROWID		(identifiesa physicalor logical row in a table)
	- BOOLEAN 		(only values of TRUE/FALSE/NULL)
	- DATE			(Date/Time from 4712 BC to 4712 AD)
	
DATA TYPE SYNONYMS
- For compatibilty with non-oracle data sources
	- IBM DB2
	- SQL Server

- Not Recommended unless you are truly accessing a non- oracle database
	DataType:	Synonym:
	NUMBER 		DEC, DECIMAL, DOUBLE PRECISION, FLOAT, INTEGERR, INT, NUMEMRIC, REAL, SMALLINT
	CHAR		CHARACTER, STRING
	VARCHAR2	VARCHAR

*/

--Set the server to output results
SET SERVEROUTPUT ON;

DECLARE

	--DECLARE VARIABLES
	nSalary 	NUMBER(4);
	cSSN		CHAR(10);
	vLName		VARCHAR(15);
	vFName		VARCHAR(15);
	dDOB		DATE;

BEGIN
	--Tell the user that everything is working
	DBMS_OUTPUT.PUT_LINE('Compiled declaration sucessfully');
END;
/