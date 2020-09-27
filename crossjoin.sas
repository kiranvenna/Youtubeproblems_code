/*Multiplying each record in one dataset
 with another dataset using  Proc SQL join.*/

/* data prep*/
data one;
	input carbrand $ msrp;
	datalines;
toyota 10000
honda 11000
BMW 12000
;
run;



data two;
	input color $ intial $;
	datalines;
Blue B
White W
Metalic M
;
run;

/* cross join with cross join key word*/


proc sql;
select one.*,
       two.*
from one 
cross join
two;
quit;

/* cross join without cross join key word*/
proc sql; 
select one.*,
       two.* 
from one  , 
two  
; 
quit;

