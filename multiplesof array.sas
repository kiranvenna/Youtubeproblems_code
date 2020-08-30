data test;
	input id Sale;
	datalines;
001 100
002 50
003 200
;

data multiples_byhardcodeway;
	set test;
	sales1=sale * 1;
	sales2=sale * 2;
	sales3=sale * 3;
	sales4=sale * 4;
	sales5=sale * 5;
run;