*This code is for 
Where vs and in Proc SQL left join;

/* data prep*/
data one;
	input id age;
	datalines;
1 25
2 35
3 45
;
run;

data two;
	input id salary;
	datalines;
1 2000
2 3000
4 4000
;
run;
/* simple on condition*/
proc sql;
select a.id, 
       a.age,
       b.salary
from one a
left join
Two b
on a.id=b.id;
quit;

/* results with "and" */
proc sql;
select a.id, 
       a.age,
       b.salary
from one a
left join
Two b
on a.id=b.id
and b.salary=3000;
quit;
/* results with "where" */
proc sql;
select a.id, 
       a.age,
       b.salary
from one a
left join
     Two b
on a.id=b.id
where b.salary=3000;
quit;

/* finding id present in one table
 and not in another table
 by using left join and where*/ 

proc sql;
select a.*
from one a
left join
     Two b
on a.id=b.id
where b.salary = .;
quit;


