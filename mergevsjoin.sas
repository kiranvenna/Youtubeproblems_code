/* 2 Scenarios where SAS merge and joins results are not same*/
data one;
	input id age;
	datalines;
2 20
2 10
;
run;

data two;
	input id salary;
	datalines;
2 5000
2 6000
2 7000
;
run;

data three_merge;
	merge one two;
	by id;
run;

proc print data=three_merge;
run;

proc sql;
	create table three_join as
	select one.*, two.salary 
	from one inner join two 
	on one.id=two.id;
QUIT;
	
Proc print;


data one_samevars;
	input id age;
	datalines;
2 20
;
run;


data two_samevars;
	input id age;
	datalines;
2 35
;
run;

data three_samevars_merge;
	merge one_samevars two_samevars;
	by id;
run;

proc print data=three_samevars_merge;
run;

proc sql;
	create table three_samevars_join as
	select * 
	from one_samevars inner join two_samevars
	on one_samevars.id=two_samevars.id;
QUIT;

proc print;
run;














