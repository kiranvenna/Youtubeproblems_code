/* compare 2 datasets and flag new records, updated records and unchanged records in SAS*/
data previous_month;
	input id salary;
	datalines;
1 1000
2 2000
4 5000
;
run;

data current_month;
	input id salary;
	datalines;
1 1000
2 3000
3 4000
;
run;

final result
id salary flag 
1 1000 "No change" 
2 3000 "Changed" 
3 4000 "New" 
4 5000  "No Change";

/* in=dataset option tell us whether a by variable from a particular dataset in a merge statement
has contributed to an observation with help of boolean value
in=dataset option creates temporary variables*/
data _null_;
	merge previous_month(in=a) current_month(in=b rename=(salary=updated_salary));
	by id;
	put id=a=b=salary=updated_salary=;
run;

*
 id=1 a=1 b=1  salary=1000 updated_salary=1000
 id=2 a=1 b=1  salary=2000  updated_salary=3000
 id=3 a=0 b=1  salary=.     updated_salary=4000
 id=4 a=1 b=0  salary=5000  updated_salary=.
;


data final (drop=updated_salary);
	merge previous_month(in=a) current_month(in=b rename=(salary=updated_salary));
	by id;

	if (a=1 and b=1) and salary=updated_salary then
		flag='No change';

	if a=1 and b=0 then
		flag='No change';

	if a=1 and b=1 and salary ne updated_salary then
		do;
			flag='Changed';
			salary=updated_salary;
		end;

	if a=0 and b=1 then
		do;
			flag='New';
			salary=updated_salary;
		end;
run;

