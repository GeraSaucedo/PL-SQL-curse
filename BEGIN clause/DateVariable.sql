/*
	working with DATE variables
	
	Date funcitons you can use: 
	- https://docs.oracle.com/cd/E17952_01/mysql-5.6-en/date-and-time-functions.html
	- https://www.techonthenet.com/oracle/functions/
*/
SET SERVEROUTPUT ON;
DECLARE
	
	--Declare variables
	EmpReviewDate	Employee.BDate%TYPE;
	EmpNextReview	EmpReviewDate%TYPE;

BEGIN
	
	--Set the variables
	EmpReviewDate := SYSDATE;
	EmpNextReview := EmpReviewDate + 100;
	--EmpNextReview := ADD_MONTHS(EmpReviewDate,1); --following month
	--EmpNextReview := ADD_MONTHS(EmpReviewDate,-1); --a month
	--EmpNextReview := LAST_DAY(EmpReviewDate); --End of month
	
	--Display the current review date
	DBMS_OUTPUT.PUT_LINE('Current review date: ' || EmpReviewDate);

	--Display the next calculateed review date
	DBMS_OUTPUT.PUT_LINE('Next Review Date: ' || EmpNextReview);

END;
/