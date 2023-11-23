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

*a character variable length 5;

data abc;
	a=100;
	output;
	a='765';
	output;
run;

