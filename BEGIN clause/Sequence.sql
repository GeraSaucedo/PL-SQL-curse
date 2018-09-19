--------------------------------------------------------------------------
--			     USING SEQUENCES				--
--------------------------------------------------------------------------
/*
- Secuences are an automated method of creating a unique value within a table
- Secuences may be referenced within the program just as any other database object
- are typically created for one field as the primary key managed by the database

*/
/* SCRIPT CREATE TABLE

DROP SEQUENCE UsrIDSeq;
DROP TABLE USERS;

--CREATE THE TABLE
CREATE TABLE SYSTEM.USERS
	(
		"FNAME" 	VARCHAR2(10 BYTE),
		"MINIT" 	CHAR(1 BYTE),
		"LNAME" 	VARCHAR2(10 BYTE),
		"SSN"		CHAR(9 BYTE),
		"BDATE"		DATE,
		"ADDRESS"	VARCHAR2(25 BYTE),
		"SEX"		CHAR(1 BYTE),
		"SALARY" 	NUMBER(6,0),
		"SUPERSSN"	CHAR(9 BYTE),
		"DNO"		NUMBER(2,0)
	) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  	STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  	PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  	TABLESPACE "SYSTEM";
COMMIT;

--alter the table
ALTER TABLE USERS
	ADD UsrID NUMBER(4) CONSTRAINT usrPK PRIMARY KEY NOVALIDATE;
COMMIT;

--Create a new SEQUENCE
CREATE SEQUENCE UsrIDSeq;
COMMIT;

--Insert data into the tables
INSERT INTO USERS VALUES
	( 	'Jerry',
		'B',
		'Smith',
		'123456789',
		TO_DATE('31-12-1995','DD-MM-YYYY'),
		'345 Coahuila, Mexico, MX',
		'M',
		30000,
		'333445555',
		5,
		UsrIDSeq.NEXTVAL	
	);

INSERT INTO USERS VALUES
	( 	'Jhon',
		'T',
		'Oktl',
		'123456789',
		TO_DATE('31-12-1995','DD-MM-YYYY'),
		'3452 Calle 2',
		'M',
		30000,
		'333445555',
		5,
		UsrIDSeq.NEXTVAL	
	);

INSERT INTO USERS VALUES
	( 	'Paula',
		'B',
		'Smith',
		'123456789',
		TO_DATE('31-10-1995','DD-MM-YYYY'),
		'345 Coahuila, Mexico, MX',
		'F',
		30000,
		'333445555',
		5,
		UsrIDSeq.NEXTVAL	
	);

INSERT INTO USERS VALUES
	( 	'Juan',
		'B',
		'Smith',
		'123456789',
		TO_DATE('31-JAN-1995','DD-MM-YYYY'),
		'345 Coahuila, Mexico, MX',
		'M',
		30000,
		'333445555',
		5,
		UsrIDSeq.NEXTVAL	
	);
------------------------------------------------
*/

SET SERVEROUTPUT ON;
DECLARE

	NewUserID 	users.usrid%TYPE;

BEGIN

	--Retrieve the next ID
	NewUserID := UsrIDSeq.NEXTVAL;

	--Insert the new record	
	INSERT INTO users (fname, minit, lname, ssn, bdate, address, sex, salary, dno, usrid)
	VALUES('Tim','X','Miles','012349999', TO_DATE('31-12-1995','DD-MM-YYYY'),'Calle 2 #423', 'M', 65000, 5, NewUserID);

	--Let the user jnow if it was successful
	DBMS_OUTPUT.PUT_LINE('Record added sucessfullyy.');

END;
/



	