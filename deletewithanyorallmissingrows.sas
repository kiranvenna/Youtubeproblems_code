/* delete records when any/all records missing*/

data test;
	infile datalines dsd;
	input coll co12 co13 $ co14 co15 $ co16 $ col7 $;
	datalines;
1,2,3,,A, B, C
9,8,3,4,Z, X,Y
3,,7,,,,
6,7,3,4,,K,
,,,,,,
10,1,13,14,K,Q,J
;

/* deleting records with any missing Value in a row*/

data bde;
	set abc;

	if cmiss(of _all_) gt 0 then
		delete;
run;

/* deleting records with all missing Value in a row
first step in this to create a macro variable
which has number of variables information */



proc sql noprint;
select nvar into :n from
 dictionary.tables 
 where upcase(libname)='WORK'
 and upcase(memname)='TEST';

%put number of variables is &n;

data final;
	set test;

	if cmiss(of _all_)=&n then
		delete;
run;


