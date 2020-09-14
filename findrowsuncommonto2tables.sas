*How to find rows that are not common to both datasets using Proc SQL join;

/* data prep*/
data one;
	input id age;
	datalines;
1 25
2 35
;
run;

data two;
	input id salary;
	datalines;
2 5000
4 4000
;
run;
/* simple full condition*/
proc sql;
create table hh as 
select coalesce(one.id, two.id) as id,
       one.age,
       two.salary
from one a
full join
Two b
on one.id=two.id;
quit;

/* using where clause to finding where ids are not same in both tables */
proc sql;
select one.id, 
       one.age,
       two.id,
       two.salary
from one a
full join 
Two b
on one.id=two.id
where one.id is missing 
or    two.id is missing;
quit;


/* adding coalesce to make output much cleaner */
proc sql;
select coalesce(one.id,two.id) as id,
       one.age,
       two.salary
from one a
full join 
Two b
on one.id=two.id
where one.id is missing 
or    two.id is missing;
quit;


 



