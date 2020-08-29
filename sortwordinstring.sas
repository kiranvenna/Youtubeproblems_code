/* topic sort words in a String in SAS*/
/* creating data for testing*/
data words_in_string_not_sorted;
	length before_sort  $40;
	before_sort="sat rat bat cat mat eat";
	output;
run;

/* code to sort words in a String in SAS*/
data words_in_string_sorted;
	set words_in_string_not_sorted;
	array col(6) $ _temporary_;

	/* creates col1 col2 col3 col4 col5 col6
	temporary elements*/
	/* scanning and extracting each
	value and assigning to each variable*/
	do i=1 to countw(before_sort);
		col{i}=scan(before_sort, i, " ");
	end;
	call sortc(of col(*));
	after_sort=catx(' ', of col{*});
	drop i;
run;