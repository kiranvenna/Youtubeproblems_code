/* SAS NOTES part1: At least one W.D format was too small
for the number to be printed.*/
* W=width
  D=decimal
  
  format 6.2
  100.2
  displays 100.20
  
  format 4.2
  100.2 
  displays 100
  
  format 2.
  100.2 
  displays **
  

  ;

data test;
	input n;
	datalines;
789
1094
876
777
666
55987
;
run;

data test1(drop =n);
	set test;
	c=put(n, 3.);
run;

data test;
	input n;
	datalines;
7
1
8
7
6
55987
;
run;

data test1;
	set test;
	c=put(n, 5.);
run;





data newtest;
	input n;
	datalines;
7898.8
1094.7
8769.6
7778.7
6669.2
5598.298
;
run;

data newtest1;
	set newtest;
	c=put(n, 3.);
run;


