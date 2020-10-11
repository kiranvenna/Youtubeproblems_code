/* data prep*/
data have;
	input Id month1 $ month2 $ month3 $ month4 $;
	datalines;
110    .            B             .     D
220    .            C             A     B               
300    A            .             V     G 
400    .            B             C     .
500    .            .             B     .
;
run;
/* code*/
data want;
	set have;
	array ch(*) _character_;
	count=0;

	do i=1 to dim(ch);

		if ch(i) ne " " then
			count=count+1;

		if count=2 then
			newvar=ch(i);
	end;
	drop i count;
run;

proc print;