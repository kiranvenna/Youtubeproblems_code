*Solving a problem and Validating/testing your results in SAS;
* 
 MHSTDAT      MHSTDTC
 UN MAR 2023 2023-03
 UN UNK 2019 2019
 un/unk/2018 2018
 un/MAY/2023 2023-05
 UN-UNK-2023 2023
 UN-UNK-2017 2017
 UN-UNK_2022 2022
 UN_UNK/2022 2022
 UN-Mar-2023 2023-03
 2022        2022
 UN/UNK/2017 2017
 
 1. pull last 4 numbers.
 2. pull middle 3 values and format it to '01' only month is valid otherwise null.
 3. do a catx (adds a seperator to combine what we get in point 1 and point 2
    if we null in point 2 seperator is not added.
 4. This may solve problem for the data above but what if our assumptions are wrong.


;

proc format;
	value $mon_num "JAN"="01" "FEB"="02" "MAR"="03" "APRIL"="04" "MAY"="05" 
		"JUN"="06" "JUL"="07" "AUG"="08" "SEP"="07" "OCT"="10" "NOV"="11" "DEC"="12" 
		OTHER=" ";
run;

/* pull last 4 numbers. = scan(MHSTDAT,-1, "_/ -")
pull middle 3 values and format it  a) scan(upcase(MHSTDAT),2, "_/ -")
                                    b) put(scan(upcase(MHSTDAT),2, "_/ -"), $mon_num.)
catx( '-', first step, second step)
*/
data t;
	infile datalines dsd;
	input MHSTDAT & $12.;
	datalines;
UN MAR 2022
UN/UNK/2019
un/unk/2019
un/MAY/2023
UN-UNK-2023
UN-UNK-2000
UN-UNK_2022
UN_UNK/2022
UN-Mar-2023
2023
UN/UNK_2017
UN/OCT_2017
;
run;

data t1;
	set t;
	length MHSTDTC $20;
	
	
	MHSTDTC=catx('-', scan(MHSTDAT,-1, "_/ -"), put(scan(upcase(MHSTDAT),2, "_/ -"), $mon_num.));
	;
run;











/* let us include some problem with our formats and our data*/

proc format;
	value $mon_num "JAN"="01" "FEB"="02" "MAR"="03" "APRIL"="04" "MAY"="05" 
		"JUN"="06" "JUL"="07" "AUG"="08" "SEP"="07" "OCT"="19" "NOV"="11" "DEC"="12" 
		OTHER=" ";
run;


data t;
	infile datalines dsd;
	input MHSTDAT & $12.;
	datalines;
UN MAR 
UNUNK/20197
un/unk/2088
un/MAY/2023
UN-UNK-2023
UN-UNK-20
UN-UNK_2022
UN_UNK/2022
UN-Mar-2023
1999
UN/UNK_2017
UN/OCT_2017
;
run;

data t1;
	set t;
	length MHSTDTC $20;
	
	
	MHSTDTC=catx('-', scan(MHSTDAT,-1, "_/ -"), put(scan(upcase(MHSTDAT),2, "_/ -"), $mon_num.));
	;
run;

/* some test i can quickly think*/

*Ist test is pattern matching;

*pattern in regular expressions  a small detour;
*

/      / =  write patterns

^  = starting point
$  =end point
\d{4} = four digits
(-\d{2}) = - followed by 2 digits
? indicates whether it could be there or not

;

data tc1;
 set t1;
  if prxmatch( '/^\d{4}(-\d{2})?$/',trim(MHSTDTC) ) = 0;
   
run;


*2nd test whether we have years not between 2017 and 2023;

data tc2;
	set t1;
	
	if (length(MHSTDTC)=4 or length(MHSTDTC)=7)
	and  (not (input(substr(MHSTDTC,1,4),4.) >=2017 and input(substr(MHSTDTC,1,4),4.)<=2023 ))
	;
run;

*3rd test whether we have months between 2023-03;
data t3;
	set t1;

	
	
	if length(MHSTDTC)=7 and 
	not(input(substr(MHSTDTC,6,2),2.) >=1 and input(substr(MHSTDTC,6,2),2.)<=12)
	;
run;

/* putting all tests together in one datastep*/

data t4_alltests;
set t1;
/* all tests in one code*/


/*test 1*/
if (prxmatch( '/^\d{4}(-\d{2})?$/',trim(MHSTDTC) ) = 0)
or

/*test 2*/
 ((length(MHSTDTC)=4 or length(MHSTDTC)=7)
	and  (not (input(substr(MHSTDTC,1,4),4.) >=2017 and input(substr(MHSTDTC,1,4),4.)<=2023 )))
	
or
/*test 3*/

(length(MHSTDTC)=7 and 
	not(input(substr(MHSTDTC,6,2),2.) >=1 and input(substr(MHSTDTC,6,2),2.)<=12));
	
run;

