/*Count(*) vs Count(variable) in Proc SQL*/

/* Data for simple count*/
data test1;
	input id;
	datalines;
10 
. 
20 
40
;

/* code to test simple count with * and variable*/
proc sql;
	select count(*) as cnt_star
	from test1;
quit;

Proc SQL;
	select count(id) as cnt_id 
	from test1;
quit;

/* data to test simple count with * and variable in a group clause*/
data tab;
	input name $ item $;
	datalines;
Smith Toy
Smith candy
Smith  .
John   .
John candy
John .
;
run;

/* code to test simple count with * and variable in a group clause*/
proc sql;
	select name, count(*) as cnt_star 
	from tab 
	group by name;
quit;

proc sql;
	select name, 
	count(item) as cnt_item from tab group by name;
quit;