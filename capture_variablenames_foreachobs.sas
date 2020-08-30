/*Finding missing variable name/names for each
observation*/
data have;
	input col1 col2 col3 col4 $ col5 $ col6 $;
	datalines;
1 . 3 A . B
5 . . B . .
. . . C R .
. 10 9 . . .
;
run;


data observation_missing_test;
	set have;

	/* creating variables to hold missing Variable values*/
	length numeric_missing character_missing $50 obServation_missing $75;

	/* logic to capture numeric missing variables names*/
	array nu(*) _numeric_;

	do i=1 to dim(nu);

		if missing(nu{i}) then
			numeric_missing=catx(' ', numeric_missing, vname(nu{i}));
	end;

	/* logic to capture character missing variables names
	avoiding character variables defined in length statement*/
	array ch(*) _character_;

	do i=1 to dim(ch);

		if missing(ch{i}) and vname(ch(i)) not in 
		                        ('character_missing', 
			'numeric_missing', 'obServation_missing') then
				character_missing=catx(' ', character_missing, vname(ch{i}));
	end;

	/* final variable names both character and numeric*/
	obServation_missing=catx(' ', numeric_missing, character_missing);
	drop i numeric_missing character_missing;
run;

proc print;