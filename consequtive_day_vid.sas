/*How to count number of consecutive visit days for each subject in SAS*/

data visits;
	input subject $ Visitday :date9.;
	format Visitday date9.;
	datalines;
ABC123 12Jan2000
ABC123 13Jan2000
ABC123 28Jan2000
ABC123 10Feb2000
BCD234 03May2000
BCD234 04May2000
BCD234 05May2000
BCD234 20MAY2000
EFG123 10Jan2000
EFG123 11Jan2000
EFG123 14Jan2000
;
run;

* final result
ABC123	2	
BCD234	3	
EFG123	2
;
*strategy 

1. Find difference with previous day in subject
2. if you find difference is greater 1 means it is not consequitive then delete from there in group
3. Start counting where difference is only 1 and sum up.
4. When the count is max within group pick that row
;

proc sort data=visits;
	by subject Visitday;
run;

/* 1Find difference with previous day in subject*/
data continuous_visits1;
	set visits;
	by subject;
	dif=Visitday -lag(Visitday);

	if first.subject then
		dif=0;
run;

/*if you find difference is greater 1 means it is consequitive then delete from there in group*/
data continuous_visits2;
	set continuous_visits1;
	by subject;
	retain new_val;

	if first.subject then
		new_val=0;

	if dif gt 1 and not first.subject then
		new_val=999;

		if new_val=999 then
			delete;
run;

/*Start counting where difference is only 1 and sum up.*/
data continuous_visits3;
	set continuous_visits2;
	by subject;
	

	if first.subject then
		visit_count=0;
	visit_count + 1;
run;

*4. When the count is max within group pick that row
;

proc means data=continuous_visits3 noprint;
	by subject;
	var visit_count;
	output out=continuous_visits(drop=_:) max=continous_visit_count;
run;

/* above three steps in one datastep*/
data continuous_visits_pre;
	set visits;
	by subject;
	retain new_val;
	dif=Visitday -lag(Visitday);

	if first.subject then
		dif=0;

	if first.subject then
		new_val=0;

	if dif gt 1 and not first.subject then
		new_val=999;

	if new_val=999 then
		delete;

	if first.subject then
		visit_count=0;
	visit_count + 1;
run;

proc means data=continuous_visits_pre noprint;
	by subject;
	var visit_count;
	output out=continuous_visits(drop=_:) max=continous_visit_count;
run;
run;