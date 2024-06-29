/* How to capture warnings from your SAS Log */

*understanding Problem;

data class;
	set sashelp.class;
run;

data class_female;
	set class;

	if sex="&myvar";
run;

data one;
	length var $2;
	var="Hi";
run;

data two;
	length var $5;
	var="Hello";
run;

data three;
	set one two;
run;

* Solving Problem;

*Done in two steps. 

1. Write your log to a particular location as file
2. Read the file which you created into SAS, then use _infile_ and parse ;

*1. Write your log to a particular location as file;

proc printto log= "/home/kiranvenna1/a1/mylog.txt";
run; 

data class;
	set sashelp.class;
run;

data class_female;
	set class;

	if sex="&myvar";
run;

data one;
	length var $2;
	var="Hi";
run;

data two;
	length var $5;
	var="Hello";
run;

data three;
	set one two;
run;

proc printto;
run;



*
2. Read the file which you created into SAS, then use _infile_ and parse ;

input buffer
 Area of memory into which each record of raw data is read when an INPUT statement executes.

_infile_ 
 automatic character variable  which reference the contents of the input buffer 
of INFILE statement.;




data test;
	infile "/home/kiranvenna1/a1/mylog.txt";
	input ;
	line=_infile_;
	if find(line, "WARNING:")>0 ;
run;


