/* concatenate 1 to 10 numbers into a
 Single Observation seperated */



data abc;
	length var $30;

	do i=1 to 10;
		var=catx(',', var, i);
	end;
run;