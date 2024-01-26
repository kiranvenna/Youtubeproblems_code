/* How to capture all input datasets and libnames used in a SAS program*/


libname test "/home/kiranvenna1/a0/";

data birthwgt;
	set test.birthwgt;
run;

libname test1 "/home/kiranvenna1/";

data cars;
	set test1.abc;
run;


/* proc scaproc works as a SAS code analyzer and it captures input, output 
information along with macro variable information

we can capture this information and push it to file*/


proc scaproc;
	record '/home/kiranvenna1/a/mydatasets.txt';
run;


libname test "/home/kiranvenna1/a0/";

data birthwgt;
	set test.birthwgt;
run;

libname test1 "/home/kiranvenna1/";

data cars;
	set test1.abc;
run;

proc scaproc;
	write;
run;


/* Reading text file into a SAS dataset*/


data myinfo;
	infile "/home/kiranvenna1/a/mydatasets.txt";
	input mysessioninfo & $500.;
run;

/* we are intersted in libname and input data*/
data myinfo;
	set myinfo;

	if findw(mysessioninfo, "LIBNAME") or (findw(mysessioninfo, "INPUT") and 
		findw(mysessioninfo, "DATA"));
run;

/* parsing the information*/
data myinfo;
	set myinfo;
	if findw(mysessioninfo, "LIBNAME") then
		mysessioninfo=tranwrd(substr(mysessioninfo, 10), " */", "");

	if findw(mysessioninfo, "INPUT") and findw(mysessioninfo, "DATA") then
		mysessioninfo=scan(substr(mysessioninfo, 1, length(mysessioninfo)-8), -1, " ");
run;

/* removing duplicate info*/
proc sort data=myinfo out=myinfo_final nodupkey;
	by mysessioninfo;
run;

* do not overwrite your datasets and also keep apporpriate names
for variables and datasets.;



/* reading and parsing in one single stepatastep*/


data myinfo;
	infile "/home/kiranvenna1/a/mydatasets.txt";
	input mysessioninfo & $500. ;

	if findw(mysessioninfo, "LIBNAME") or (findw(mysessioninfo, "INPUT") and 
		findw(mysessioninfo, "DATA"));
	;

	if findw(mysessioninfo, "LIBNAME") then
		mysessioninfo=tranwrd(substr(mysessioninfo, 14), " */", "");

	if findw(mysessioninfo, "INPUT") and findw(mysessioninfo, "DATA") then
		mysessioninfo=scan(substr(mysessioninfo, 1, length(mysessioninfo)-8), -1, " ");
run;

proc sort data=myinfo out=myinfofinal nodupkey;
	by mysessioninfo;
run;




































