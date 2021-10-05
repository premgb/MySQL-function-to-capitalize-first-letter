#########################################################################################
# function to capitalize the first letter of each word in a string
#########################################################################################

delimiter //
create function initcap(str varchar(100)) returns varchar(100)
begin                                    
	#initialize variables
	set str = lower(str);
	set @str_length = char_length(str);    
	set @counter = 0;

	# parse each letter of string and when space is encountered...
	# then capitalize the next letter and write converted string back to the orignal string
	string_parse: loop
		if @counter = @str_length then 
			leave string_parse;
		end if;

		if substring(str, @counter, 1) = ' ' then
			set str = concat(left(str, @counter), ucase(substring(str, @counter + 1, 1)), right(str, @str_length - (@counter + 1)));
		end if;

		set @counter = @counter + 1;
	end loop;
	return str;
end//

delimiter ;                     
select initcap('hello, this scRipt was written by prem.');
#SELECT initcap('UNITED states Of AmERIca');