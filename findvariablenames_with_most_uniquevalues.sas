/* Finding which variable has most number of unique values */
/* sample dataset*/
data test;
input var1 var2 var3 $ var4 $;
datalines;
10 11 q a
20 62 q j
20 33 b r
50 47 h w
50 47 i e
10 .  j f
;
run;



/*Proc freq nlevels
helps to capture variable name and number of unique values*/

ods output nlevels=test1;
proc freq data=test nlevels ;
run;
/*helps to capture variable which has maximum unique values*/
proc sql;
select tablevar as variable_name,
        nlevels as numof_unique_values
from test1
where nlevels=(select max(nlevels) 
               from test1);
quit;













