DATA patient_SBPInfo;
	INPUT patient_id VISIT $ SBP;
	DATALINES;
100 V1 140
100 V2 110
100 V3 120
100 V4 131
200 V1 109
200 V2 110
200 V3 130
;
RUN;

proc print;
proc sort data=patient_SBPInfo;
	by patient_id SBP;
run;


data want;
	set patient_SBPInfo;
	by patient_id;
	retain SBP_min;

	if first.patient_id then
		sbp_min=SBP;

	if SBp-SBP_min gt 20;
	drop SBP_min;
run;

proc print;

