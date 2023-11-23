/*quick tip: Advantage of using missing function rather than hard coding */
/*
IN SAS we indicate . AS MISSING value for numeric
and '' for character variables*/
data line_msg_MISSING;
	set sashelp.CLNMSG;
	WHERE LINENO=.;
RUN;

data level_msg_MISSING;
	set sashelp.CLNMSG;
	WHERE LEVEL='';
RUN;

data line_msg_MISSING;
	set sashelp.CLNMSG;
	where missing(LINENO);
RUN;

data level_msg_MISSING;
	set sashelp.CLNMSG;

	if not missing(LEVEL);
RUN;

data test;
	input id 1-3 wtgrp $ 5-12 no_of_pts 14-15;
	datalines;
123 Group A  10
123 Group B  20
123 Group C  30
124 Group A  40
124 Group B  50
;

data test1(rename=(no_of_pts1=no_of_pts newwtgrp=wtgrp));
	set test;
	by id;
	retain newwtgrp;
	length newwtgrp $60;

	if first.id then
		newwtgrp="pooled " ||scan(wtgrp, 2);
	else
		newwtgrp=catx(' and ', newwtgrp, scan(wtgrp, 2));

	if first.id then
		no_of_pts=0;
	no_of_pts1+no_of_pts;
	drop no_of_pts wtgrp;

	if last.id;
run;

proc print;
run;