*Understanding in=dataset option in a merge statement;

data have1;
	input id name $;
	datalines;
1 John
2 Sam
;
run;

data have2;
	input id age;
	datalines;
1 30
3 40
;
run;

/* merge combines observations from datasets mentioned
in merge statement based of variable/variables mentioned
in by statement

need to do a proc sort

proc sort data=have1;
by id;
run;



have1  have2               id name age

1 John 1 30           ---  1  john 30
2 Sam                      2  Sam
3 40                3       40


*/
data want1;
	merge have1 have2;
	by id;
run;

proc print;
run;

/* in=dataset option tell us whether a by variable from a particular dataset in a merge statement
has contributed to an observation with help of boolean value

creates temp variable
*/
data _null_;
	merge have1(in=a) have2(in=b);
	by id;
	put a=b=id=name=age=;
run;

*
 a=1 b=1 id=1 name=John age=30
 a=1 b=0 id=2 name=Sam  age=.
 a=0 b=1 id=3 name=     age=40
;

/* by variable in both datasets*/
data want2;
	merge have1(in=a) have2(in=b);
	by id;

	if a=1 and b=1;
run;

proc print;
run;

/* simplying =1*/
data want2;
	merge have1(in=a) have2(in=b);
	by id;

	if a and b;
run;

proc print;
run;

*
 a=1 b=1 id=1 name=John age=30
 a=1 b=0 id=2 name=Sam  age=.
 a=0 b=1 id=3 name=     age=40
;

/* by variable in left dataset*/
data want3;
	merge have1(in=a) have2(in=b);
	by id;

	if a;
run;

proc print;
run;

/* by variable in right dataset*/
data want4;
	merge have1(in=a) have2(in=b);
	by id;

	if b;
run;

proc print;
run;

*
 a=1 b=1 id=1 name=John age=30
 a=1 b=0 id=2 name=Sam  age=.
 a=0 b=1 id=3 name=     age=40
;

/* = 0 not* by variable not in left/first dataset*/
data want5;
	merge have1(in=a) have2(in=b);
	by id;

	/*if a=0;*/
	if not a;
run;

proc print;
run;

/*by variable not in right/second dataset*/
data want6;
	merge have1(in=a) have2(in=b);
	by id;

	if not b;
run;

proc print;
run;

*
 a=1 b=1 id=1 name=John age=30
 a=1 b=0 id=2 name=Sam  age=.
 a=0 b=1 id=3 name=     age=40
;

/*by variable not in either left/first or right/second dataset*/
data want7;
	merge have1(in=a) have2(in=b);
	by id;

	if not a or not b;
run;

proc print;
run;

*
 a=1 b=1 id=1 name=John age=30
 a=1 b=0 id=2 name=Sam  age=.
 a=0 b=1 id=3 name=     age=40
;

/*by variable  left/first but not in right/second dataset*/
data want8;
	merge have1(in=a) have2(in=b);
	by id;

	if a and not b;
run;

proc print;
run;

/*by variable not in  left/first but in right/second dataset*/
data want9;
	merge have1(in=a) have2(in=b);
	by id;

	if not a and b;
run;

proc print;
run;

data t;
	a=100.567908;
	output;
	a=100.567908988;
	output;
run;

data t1;
	set t;
	b=scan(put(A, 20.15), 2, ".");
run;

data have1;
	set have;

	if age=10 then
		group=1;
	else if age ge 20 and age le 30 then
		group=2;
	else
		group=3;
run;