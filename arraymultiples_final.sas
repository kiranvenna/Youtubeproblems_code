/*Creating variables with multiples of one
 from a single variable using SAS Array*/
data test;
	input id Sale;
	datalines;
001 100
002 50
003 200
;
data multiples_array;
	set test;
	/*This will create 100 variables
	from sales1 to sales100*/
	array sales(100) ;
     
	do i=1 to 100;
		sales{i}=sale*i;
	end;
	drop i;
run;


/* shortcut

Sales{5} is enough no need to ecplicitly define Sales1 Sales2 etc
will create Sales1 Sales2 Sales3 Sales4 Sales5*/