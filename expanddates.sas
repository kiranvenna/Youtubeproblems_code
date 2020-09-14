/* expanding dates*/
/* data prep*/

data date;
	input id $ startdate :yymmdd. enddate :yymmdd.;
	format startdate enddate yymmdd10.;
	datalines;
001 20200327 20200327
002 20200313 20200317
003 20200304 20200310
;
run;

proc print noobs;
/* code for expanding dates*/
data date2;
	set DATE;

	do newdate=startdate to enddate;
		output;
	end;
	format newdate yymmdd10.;
	drop startdate enddate;
run;

proc print noobs;