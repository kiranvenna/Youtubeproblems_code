/*  count missing variables in an observation 
after at least one non-missing value.(SAS arrays) */

/* sample dataset*/
data example;
	input @1 id:$3. (var1-var12)(:$1.);
	cards;
001 A B C . . . . . A A A C
002 C C B A C B A . . . . .
003 . . . . A B C A B C B .
004 . . . . C A A . C . A .   7 -4=3
005 . . . . A C A C A C . .
006 C B A . . . . . A A A C
;
run;

Proc print;
run;

/* code to solve the problems*/ 

data want;
	set example;
	total_miss=cmiss(of var1--var12);
	array myvar(*) $ var1--var12;
   
	do i=1 to dim(myvar);

		if not missing(myvar{i}) then
			leave;
	end;
	/* we are using i as number of missing values before a non missing value starts*/
	i=i-1;
	total_miss=total_miss- i;
	drop i;
run;

proc print;
run;