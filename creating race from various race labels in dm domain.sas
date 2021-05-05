/* data preparation*/
data test;
	input studyid $ Race1 Race2 Race3 Race4 Race5;
	label RACE1="American Indian or Alaska Native" RACE2="Asian" 
		RACE3="Black or African American" 
		RACE4="Native Hawaiian or Other Pacific Isl" RACE5="Caucasian";
	datalines;
001 1 . . . .
002 . 1 . 1 .
003 1 . . . .
004 .  . 1 . .
005 1 . . . 1
;
run;
/* code to find race from different race variable labels*/
data dm2001;
	set test;
	length race $200;
	count=0;
	array b(5) race1 race2 race3 race4 race5;

	do i=1 to 5;

		if not missing(b{i}) then
			do;
				race=vlabel(b{i});
				count=count+1;
			end;
	end;

	if count gt 1 then
		race="Multiple";
	drop count i;
run;

proc print ;