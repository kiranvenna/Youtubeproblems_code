/*how to avoid infinite do loops in SAS*/
intial amount is 10 each time I want to add 2.25 and output like this i want to 
	10 times or may be 20 times/ other scenario later amt+2.25;
output;
amt+2.25;
output;

/*non conditional do loop*/
data test;
	amt=10;

	do i=1 to 10;
		amt+2.25;
		output;
	end;
run;

/* resetting index variable such that it never reaches to end */
data test;
	amt=10;

	do i=1 to 10;
		i=2;
		amt+2.25;
		output;
	end;
run;

data test;
	amt=10;

	do i=1 to 10;
		i=2;
		amt+2.25;
		output;
		;

		if amt > 30 then
			leave;
	end;
run;

data test;
	amt=10;

	do i=1 to 10;
		i=2;
		amt+2.25;
		output;
		;

		if amt > 30 then
			i=10;
	end;
run;

/*  looping based of condition*/
/* do until --- loops till condition became true*/
data test;
	amt=10;

	do until(amt>30);
		amt+2.25;
		output;
	end;
run;

data test;
	amt=10;

	do until(amt=30);
		amt+2.25;
		output;
	end;
run;

data test;
	amt=10;

	do until(amt=30);
		val+1;
		amt+2.25;
		output;

		if val ge 10 then
			leave;
	end;
run;

/* do while --- loops while condition is true
and ends once condition is false*/
data test;
	amt=10;

	do while(amt<30);
		amt+2.25;
		output;
	end;
run;

data test;
	amt=10;

	do while(amt>5);
		amt+2.25;
		output;
	end;
run;

data test;
	amt=10;

	do while(amt>5);
		amt+2.25;
		val+1;
		output;

		if val ge 10 then
			leave;
	end;
run;

/* combine iterative loop with loop based of condition*/
data test;
	amt=10;

	do i=1 to 10 until(amt>35);
	    i=2;
		amt+2.25;
		output;
	end;
run;

