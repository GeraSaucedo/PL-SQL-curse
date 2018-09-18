--------------------------------------------------
-- 	     EXCEPTION & ENBEDDED SQL		--
--------------------------------------------------
/*
	When ceating a SELECT...INTO statement,you
	must ensure that it returns a single row.
	- That is the reason dor the ROWNUM <= 1 criteria.

	if more than one row where returned, then the
	TOO_MANY_ROWS exception would have returned

*/
