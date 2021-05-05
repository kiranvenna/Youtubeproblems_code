data want;
	set have;
	array nu(12) var1--var12;
	count_front=0;
	count_back=0;

	do i=1 to 12;

		if nu{i}=. then
			count_front=count_front+1;
		else if nu{i} ne . then
			leave;
	end;

	do j=12 to 1 by -1;

		/* if all are missing then do not check from back and leave the loop*/
		if count_front=12 then
			leave;

		if nu{j}=. then
			count_back=count_back+1;
		else if nu{j} ne . then
			leave;
	end;

	if count_front=1 then
		count_front=0;

	if count_back=1 then
		count_back=0;

	/* add count of consequtive missing values from beggining with end*/
	count=count_front+count_back;
	drop i j count_front count_back;
run;

proc print;
data;