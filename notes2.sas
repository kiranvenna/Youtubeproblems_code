/* SAS NOTES part2: Variable wieght is uninitialized.*/
data class;
	set sashelp.class;
	wieght1=wieght;	
run;



proc contents data=sashelp.class;
run;


/* datastep has 2 phases (very high level)

1st step: compilation -- variable attributes are set
2nd step execution -- each row is read one after another
*/


data test;
set sashelp.class;
format newvar $10.;
run;
