/* How to sort SAS dataset without
using proc sort or order by using simple macro*/

/*sample dataset to sort*/
data have;
input var ;
datalines;
150
175
1000
90
100
60
40
70
;
run;


/* final dataset to hold sorted record*/
proc sql;
create table want 
(var num
);
quit;

options symbolgen mprint;
/* simple macro to sort data without sort by*/
%macro jj;
	proc sql noprint;;
		select count(*) into :cnt from have;

		%do i=1 %to &cnt;
			insert into want 
			select min(var) from have;
			
			delete from have
			where var in(select var from want);
		%end;
	quit;
	%mend;

%jj;

	proc print data=want;
	run;