*building advance macro to check dynamically
whether a particular id is available in a particular table*/

/* data to check macro code*/
data first_status;
	input id col1 $ col2$;
	datalines;
40 A B
50 C D
60 E F
;

data second_status;
	input new_id col1 $ col2$;
	datalines;
30 A B
20 C D
60 E F
;

data third_status;
	input id col5 $ col2$;
	datalines;
100 A B
150 C D
100 E F
;

data fourth_status;
	input new_id col1 $ col2$;
	datalines;
110 A B
510 C D
610 E F
;

	/* building reference/control table
	data reference;
	length name $20;
	input name $ id_col $;
	datalines;
	first_status id
	second_status new_id
	third_status id
	fourth_status new_id
	;
	run;
	
	/*Full Basic macro*/
	%macro check (val=);
	proc sql noprint;
		select name , id_col into :table1 - , :col1 - from reference;

		/*get total count reference table for max value of do loop*/
		select count(*) into :cnt from reference;

		/* finally loop through the table*/ 

		%do i=1 %to &cnt;
			title "Information in &&table&i table";

			/* this is our intial query which check for id value */
		proc sql;
			select * from &&table&i where &&col&i=&val;
		%end;
	%mend;

	%check(val=30);

	/* macro with  title and printing required information
	this is not there in youtube video*/
	%macro checks (val=);
	proc sql noprint;
		select name , id_col into :table1 - , :col1 - from reference;

		/*get total count reference table for max value of do loop*/
		select count(*) into :cnt from reference;

		/* finally loop through the table*/ 

		
		
		
		%do i=1 %to &cnt;

		proc sql noprint;
			create table &&table&i.._x as select * from &&table&i 
			where &&col&i=&val;
			select count(*) into :cnt1 from &&table&i.._x;

			%if &cnt1 ne 0 %then
				%do;
					title "Information in &&table&i table";

					/* this is our intial query which check for id value */
				proc sql;
					select * from &&table&i where &&col&i=&val;
				%end;
		%end;
	%mend;

	%checks(val=30);