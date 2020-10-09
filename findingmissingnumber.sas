/* How to find missing numbers
in a Sequence*/
/* data prep*/
data test;
	do var=4 to 20;

		if Var in (5, 7, 9, 13, 14) then
			continue;
		output;
	end;
run;

proc print noobs;
/* finding min and max values*/
proc sql;
	create table test1 as 
	select min(var) as min, 
	max(var) as max from test;
quit;
/* generating all numbers including missing numbers*/
data all_numbers;
	set test1;

	do var=min to max;
		output;
	end;
	drop min max;
run;
/* finding Sequence which are not there */
proc sql;
	select * 
	from all_numbers 
	where var not in(select var from test);
quit;