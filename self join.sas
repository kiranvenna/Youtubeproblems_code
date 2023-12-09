*Understanding the concept of self Join with an unique example;

*goal is to find records on particular day 
where same amount was deposited and taken out;

data transactions;
	input t_date:date9. amount;
	format t_date date9.;
	datalines;
03Nov2023   9400
03Nov2023   300
03Nov2023  -9400
06Nov2023   2000
06Nov2023   500
06Nov2023   400
06Nov2023   -500
06Nov2023   -400
13Nov2023   5000
13Nov2023    -5000
17Nov2023    600
17Nov2023    100
17Nov2023   -600
;
run;


*
select a.* from 
transactions a
inner join
transactions b
on a.date =b.date
and a.amount= -b.amount

-9400 = -9400

A                     B
---------------    ------------------
03Nov2023   9400   03Nov2023   9400        03Nov2023   9400
03Nov2023   300    03Nov2023   300         03Nov2023  -9400   
03Nov2023  -9400   03Nov2023  -9400

06Nov2023   2000   06Nov2023   2000
06Nov2023   500    06Nov2023   500
06Nov2023   400    06Nov2023   400
06Nov2023   -500   06Nov2023   -500
06Nov2023   -400  06Nov2023   -400

13Nov2023   5000   13Nov2023   5000
13Nov2023   -5000  13Nov2023   -5000

17Nov2023    600   17Nov2023    600
17Nov2023    100   17Nov2023    100   
17Nov2023   -600   17Nov2023   -600

;




proc sql;
    select      a.* 
	from        transactions a 
	inner join  transactions b 
	on           a.t_date=b.t_date 
	and          a.amount=-b.amount;
quit;



