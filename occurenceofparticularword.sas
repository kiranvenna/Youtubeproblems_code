/* data to check*/
data have;
	a='music heals music is cool music is awesome';
run;

/*final code to check occurence of particular word*/

data want;
	a='music heals music is cool music is awesome';

	do i=1 to countw(a);

		if scan(a, i)='music' then
			count_music+1;
	end;
	drop i;
run;

