/* Finding variables with all missing values in a SAS dataset*/
data test;
	input var1-var6;
	datalines;
1 10 20 . 40 .
2 .  30 . .  .
3 20 .  . 90 .
4 .  70 . 50 .
;
run;

/*nlevels tell us number of levels for variables mentioned in table statement*/
proc freq data=test nlevels;
run;

/* ods trace prints information about all the output objects*/
ods trace on;

proc freq data=test nlevels;
run;

ods trace off;

/* selecting specific output objects*/
ods select nlevels;

proc freq data=test nlevels;
run;

/*creating dataset final code*/
ods select nlevels;

proc freq data=test nlevels;
	ods output nlevels=missing_value_records;
run;

data missing_value_records_final (keep=tablevar);
	set missing_value_records;

	if nnonmisslevels=0;
run;


proc print;
run;