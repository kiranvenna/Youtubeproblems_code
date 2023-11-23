/* creating datasets from each variable in a SAS dataset*/

* 1st step;

proc contents data=sashelp.cars;
run;

* 2nd step;

data cylinders;
	set sashelp.cars(keep=cylinders);
run;


data DriveTrain;
	set sashelp.cars(keep=DriveTrain);
run;



data EngineSize;
	set sashelp.cars(keep=EngineSize);
run;



proc contents daya=sashelp.cars out=vars_cars(keep=name);
run;


data _null_;
set vars_cars;
call execute ("data "||name ||"; set sashelp.cars (keep="|| name ||");run;");
run;





















* so on ;


* what are problems;


* how to solve ;

/* step 1*/
proc contents data=sashelp.cars out=vars_cars(keep=name);
run;

/*step2*/

proc sql  noprint;
		select name into :var1 - 
	from vars_cars;
	quit;
	

%put &var1 &var2;
	
/* step3*/

	
%do i=1 %to &sqlobs;

		data &&var&i;
			set sashelp.cars(keep=&&var&i);
		run;

	%end;
	
options mprint;
%macro t;
	proc contents data=sashelp.cars out=vars_cars(keep=name);
	run;

	proc sql  noprint;
		select name into :var1 - 
	from vars_cars;
	quit;

	%do i=1 %to &sqlobs;

		data &&var&i;
			set sashelp.cars(keep=&&var&i);
		run;

	%end;
%mend;

%t;

/* limitation from above macro*/



%macro t1 (dsn=);
	proc contents data=&dsn out=vars_%scan(&dsn,-1,.)(keep=name);
	run;

	proc sql  noprint;
		select name into :var1 - 
	from vars_%scan(&dsn,-1,.);
	quit;

	%do i=1 %to &sqlobs;

		data &&var&i;
			set &dsn(keep=&&var&i);
		run;

	%end;
%mend;

%t1(dsn=sashelp.cars)

%t1(dsn=sashelp.class)

