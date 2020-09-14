*==========================================
Copying all datasets from one library
 to another easily
==========================================;
libname mylib '/home/kiranvenna1/mydatasets';

Proc copy in=sashelp out=work memtype=data;
run;

/* copying few datasets*/
Proc copy in=sashelp out=mylib memtype = data;
select class cars heart;
run;




