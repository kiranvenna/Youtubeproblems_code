/*Finding whether a number is prime or not in SAS*/
/* longer code to achieve this*/
data abc;
	length type $20;
	num=11;

	do i=1 to ceil(num/2);

		if mod(num, i)=0 and i ne 1 then
			do;
				type="composite";

				/*if it is divisible by something say it non prime and leave*/
				leave;
			end;
		else
			do;
				type="prime";
			end;
	end;
	drop i;
run;

/* shorter vesion code*/
data abcd;
	length type $20;
	num=11;

	do i=1 to ceil(num/2) until(mod(num, i)=0 and i ne 1);

		if mod(num, i)=0 and i ne 1 then
			type="composite";
		else
			type="prime";
	end;
	drop i;
run;