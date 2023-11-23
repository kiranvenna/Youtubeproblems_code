/* quick tip: if and else if vs multiple ifs*/

data have;
	input q1 q2;
	datalines;
1  1 
1  2
2  3
;
run;

1  1  10
1  2. 20
2  3. 20

data ifelseif;
	set have;

	if q1=1 then
		newvar=10;
	else if q2 >=2 then
		newvar=20;
run;

title "if and else if";

proc print;
run;

data multipleifs;
	set have;

	if q1=1 then
		newvar=10;

	if q2 >=2 then
		newvar=20;
run;

title "if and multipleifs";

proc print;
run;