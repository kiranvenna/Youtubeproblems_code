/*Change all visits of patient to missing only if first visit is missing.*/

/* data preparation*/
data patinet_data;
	input patient_id visit $  SBP;
	datalines;
100 Visit1 .         
100 Visit2 110
100 visit3 120
101 visit1 111
101 visit2 .
101 visit3 128
;
run;

/* code*/
data patinet_data1;
	set patinet_data;
	by patient_id;
	retain SBP_new;

	if first.patient_id then 
		sbp_new=sbp;

	if sbp_new=. then
		sbp=sbp_new;
	drop sbp_new;
run;

proc print;