#!/usr/bin/awk -f

BEGIN {
	FS = ":"
	print "Overall Money from each took"
	}
	
/ Took/{
	split($1, name, " ")
    firstName = name[1]
    tookMoney = $3 + $4 + $5
    print firstName, "$" tookMoney
    }
    

