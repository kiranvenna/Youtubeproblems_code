/* How to insert a observation
for total after each by group in SAS data step*/
/* sample dataset*/
data test;
	input id $ day_num $ val;
	datalines;
001 day1 10
001 day2 15
001 day3 10
001 day4 25
002 day1 5
002 day2 4
002 day3 6
003 day1 100
003 day2 60
;
run;

/* code to solve the problem*/
data final;
	set test;
	by id;

	if first.id then
		sum_val=0;
	sum_val+val;
	output;

	if last.id then
		do;
			id="total";
			day_num=" ";
			val=sum_val;
			output;
		end;
	drop sum_val;
run;