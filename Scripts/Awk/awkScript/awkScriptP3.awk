#!/usr/bin/awk -f

BEGIN {
	FS = ":"
	print "Users who's last contribution was more than 10 and less than 200"
	}	
	

{ 
    average = ($3 + $4 + $5) / 3
    if (average < 300) {
        print $1, "$" average
    }
}