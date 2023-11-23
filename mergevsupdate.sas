/*Quick look of SAS merge vs SAS update statement*/
data have1;
	input id $ var1 var2;
	datalines;
001 10 20
002 .  30
003 40 .
;

data have2;
	input id $ var1 var2;
	datalines;
001 12 .
002 52 30
003 40 70
;
run;

*
Have1        have2
001 10 20    001 12 .      001 12 .
002 .  30    002 52 30     002 52 30
003 40 .     003 40 70     003 40 70
;

data merge_haves;
	merge have1 have2;
	by id;
run;

title "result from merge";

proc print data=merge_haves;
run;

*
001 10 20    001 12 .      001 12 20
002 .  30    002 52 30     002 52 30
003 40 .     003 40 70     003 40 70
;

data update_haves;
	update have1 have2;
	by id;
run;

title "result from update";

proc print data=update_haves;
run;



