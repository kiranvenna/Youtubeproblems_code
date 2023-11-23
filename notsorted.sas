*Understanding not sorted option(quick tip);


data test;
	input id $ sbp dt:date9.;
	format dt date9.;
	datalines;
002 130 01Jan2022
002 112 02Jan2022
002 110 06Jan2022
002 115 08Jan2022
001 119 03Jan2022
001 122 07Jan2022
001 116 09Jan2022
001 117 11Jan2022
;
run;


data test_final;
	set test;
	by id notsorted;

	if first.id;
run;