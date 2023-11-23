/*quick tip-- finding end of month for a given day in sas*/

Intnx gives increment by interval(could be day,week,qtr,month,year)
syntax intnx('interval', given date ,increment,'alignment for that interval');


data t;
	dt='07FEB2022'd;
next_month_end= intnx('month', dt,1,'e');
format dt next_month_end date9.;
run;


data t;
	dt='07FEB2022'd;
same_month_end= intnx('month', dt,0,'e');
format dt same_month_end date9.;
run;