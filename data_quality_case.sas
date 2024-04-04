*Couple of strategies to test and resolve data issues with case When Statements:  ;
*Scenario 1: Case specificity of the character variable value ;

data scenario1;
	input id short_prof $;
	datalines;
1 Doc
2 Act
3 Doc
4 Act
5 Eng
6 act
7 Eng
8 xyz
;
run;


proc sql;
create table scenario1_assignment as
select *, 
       case 
           when short_prof ='Act' then 'Actor'
           when short_prof ='Doc' then 'Doctor'
           when short_prof ='Eng' then 'Engineer'
         else "something else"
      end as profession
from scenario1;
quit;

/*test*/
proc sql;
select distinct short_prof
from scenario1_assignment
where profession="something else";
quit;

/* how to fix it */
proc sql;
create table scenario1_assignment as
select *, 
       case 
           when upcase(short_prof) ='ACT' then 'Actor'
           when upcase(short_prof) ='DOC' then 'Doctor'
           when upcase(short_prof) ='ENG' then 'Engineer'
         else "something else"
      end as profession
from scenario1;
quit;

/*retest code*/

proc sql;
select distinct short_prof
from  scenario1_assignment
where profession="something else";
quit;

*scenario II-- different issue;

data scenario2;
	input id short_prof $;
	datalines;
1 Doc
2 Act
3 Doc
4 Act
5 Eng
6 Actor
7 Eng
8 xyz
;
run;


proc sql;
create table scenario2_assignment as
select *, 
       case 
           when short_prof ='Act' then 'Actor'
           when short_prof ='Doc' then 'Doctor'
           when short_prof ='Eng' then 'Engineer'
         else "something else"
      end as profession
from scenario2;
quit;

/*test*/
proc sql;
select distinct short_prof
from scenario2_assignment
where profession="something else";
quit;

/* how to fix it */
proc sql;
create table scenario2_assignment as
select *, 
       case 
           when upcase(short_prof) in('ACT','ACTOR') then 'Actor'
           when upcase(short_prof) ='DOC' then 'Doctor'
           when upcase(short_prof) ='ENG' then 'Engineer'
         else "something else"
      end as profession
from scenario2;
quit;

/*retest code*/

proc sql;
select distinct short_prof
from   scenario2_assignment
where profession="something else";
quit;



*. mistake from programmer itself;

data scenario3;
	input id short_prof $;
	datalines;
1 Doc
2 Act
3 Doc
4 Act
5 Eng
6 Act
7 Eng
8 xyz
;
run;


proc sql;
create table scenario3_assignment as
select *, 
       case 
           when short_prof ='Act' then 'Actor'
           when short_prof ='Doc' then 'Doctor'
           when short_prof ='Eng' then 'Doctor'
         else "something else"
      end as profession
from scenario3;
quit;

/*test*/
proc sql;
select distinct short_prof,
                profession
from scenario3_assignment;
quit;

/* how to fix it */
proc sql;
create table scenario3_assignment as
select *, 
       case 
           when upcase(short_prof) in('ACT') then 'Actor'
           when upcase(short_prof) ='DOC' then 'Doctor'
           when upcase(short_prof) ='ENG' then 'Engineer'
         else "something else"
      end as profession
from scenario3;
quit;

/*retest code*/

proc sql;
select distinct short_prof,
                profession
from scenario3_assignment;
quit;
















