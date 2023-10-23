#!/usr/bin/awk -f

BEGIN {
	FS = ":"
	print "Users who's last contribution was more than 10 and less than 200"
	}	
	
{
	if ($5 > 10 && $5 < 200){
		print $1, "$" $5
		}
}

