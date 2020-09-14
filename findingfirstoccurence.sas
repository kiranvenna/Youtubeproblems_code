/*Finding variable name for first occurrence of particular value in a row*/

/* data to test*/
data test;
	input Var1 $ col1-col6;
	datalines;
A 0 1 0 1 0 1
B 1 1 1 0 1 0
C 1 0 1 0 1 1
;
run;

proc print;
/* code for variable name for first occurrence of Zero in a row*/
data final;
	set test;
	array h(*) _numeric_;

	do i=1 to dim(h);

		if h{i}=0 then
			do;
				colname=vname(h{i});
				leave;
			end;
	end;
run;

proc print;