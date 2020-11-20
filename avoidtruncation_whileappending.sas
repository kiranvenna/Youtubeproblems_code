data one;
	input name:$5. Country:$5. age;
	datalines;
Smith USA 30
;
run;

proc print;
data two;
	input name:$5. Country:$9. age;
	datalines;
Jacob Australia 40
;
run;
proc print;
/* by using outer union corresponding 
instead of set statement will avoid truncation*/
Proc SQL;
create table three as 
select * from one 
outer union corresponding 
select * from two;
quit;
proc print;
