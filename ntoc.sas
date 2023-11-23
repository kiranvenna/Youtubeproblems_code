/*
Understanding character value have been converted to numeric values
and vice versa with DATA step phases

*/
/* data step

compilation phase: data attributes are set
during compilation phase
Where variable attribute is defined first matters
execution phase: when data is read
*/
data abc;
	a='hello';
	output;
	a=100;
	output;
run;

a character variable length 5;

data abc;
	a=100;
	output;
	a='765';
	output;
run;

a numeric variable SAS table --  daily data 1 custid nid, 
	oracle ---- historical data.   -----45. 70 custid nid, load_dt proc sql;
update oradb.table a set a.nid=(select distinct nid from sasdb.table b where 
	a.id=b.id and b.nid is not missing) where a.nid is missing and a.load_dt 
	between today()-45 and today();
--- 5 minutes data oradb.table_temp(bulkload=yes) set sasdb.table;
run;

proc sql;
proc sql;
	connect to oracle;
	execute(update oradb.table a set a.nid=(select distinct nid from 
		oradb.table_temp b where a.id=b.id and b.nid is not missing) where a.nid is 
		missing and a.load_dt between today()-45 and today();
	first step i have moved 1 million sas table to oracle table used this oracle 
		table to update another table in oracle itself;

data t;
	do date='01jan2023'D to '31DEC2023'D;

		if weekday(date) not in (7, 1) then
			output;
		format date date9.;
	end;
run;