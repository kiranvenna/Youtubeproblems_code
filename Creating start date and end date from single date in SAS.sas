/*Creating start date and end date from single date in SAS*/

/*sample dataset*/
data test;
	input id_num X date:mmddyy10.;
	format date mmddyy10.;
	datalines;
1 10   1/7/2021   
1 13.5 1/10/2021   
1 12.8 1/11/2021   
1 15   1/15/2021
2 12   1/8/2021
2 14   1/12/2021 
;
run;

proc print;
run;
/* final code*/
data final;
	merge test(rename=(date=start_date)) 
	      test (firstobs=2 rename=(id_num=id_num1 date=end_date) 
	      drop=X);

	if id_num=id_num1 then
		end_date=end_date-1;
	else
		end_date="31dec2099"d;
	drop id_num1;
run;
proc print;
run;

