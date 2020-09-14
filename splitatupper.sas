/* Splitting at upcase letter*/
/* data prep*/
data abc;
	length fullname $20;
	fullname="MarkSmith";
	output;
	fullname="KishoreKumar";
	output;
	
run;
/* code to split data at upcase*/
data bde;
	set abc;
	first=
	substr(fullname, 1, anyupper(fullname, 2)-1)/*upper function with substr*/;
	last=substr(fullname, anyupper(fullname, 2));
run;