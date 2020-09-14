/* Creating empty SAS dataset from another dataset
using Datastep and Proc SQL*/

Data class1;
	set sashelp.class(obs=0);
run;


Proc SQL;
	create table class2 like sashelp.class;
quit;