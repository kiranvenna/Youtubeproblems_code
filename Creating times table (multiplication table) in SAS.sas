/* Creating times table (multiplication table) in SAS*/
data test;
	/* change a to the table you want*/
	a=2;

	do i=1 to 10;
		c=a*i;
		TIMES_TABLE=cat(a, " X ", i, " = ", c);
		output;
	end;
	keep TIMES_TABLE;
run;

proc print data=test noobs;
run;


