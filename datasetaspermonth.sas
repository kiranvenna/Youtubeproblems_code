/*Pick different dataset in your process as per odd/even month number in SAS*/

even month numbers pick sashelp.cars
odd month numbers pick sashelp.class;



/* month function month from date*/
data test;
	month_calc1=month("02oct2022"D);
	month_calc2=month("05Sep2022"D);
run;

*
SAS MOD function returns remainder when you divide one number by another.
remainder = MOD(dividend, divisor);

data test1;
	even=mod(10, 2);
	odd=mod(9, 2);
run;


/* below we are doing three things
1. extracting month from date
2. After month exaction using mod 
3. mod function value we are capturing in macro variable by using call symputx
*/
data _null_;
	current_month=month(today());
	call symputx('modulo', mod(current_month, 2));
run;

%put value of modulo macrovariable is &modulo;





%if &modulo = 0 %then 
  %do;
	 %let dsn_as_permonth= SASHELP.CARS;
  %end;
%else 
  %do;
	%let dsn_as_permonth =SASHELP.CLASS;
%end;
 
 %put value of dsn_as_permonth macrovariable is &dsn_as_permonth;

title "dataset printed out is &dsn_as_permonth";

proc print data=&dsn_as_permonth;
run;