#!/usr/bin/awk -f

{FS = ":"}

/ Took/ {
    split($1, name, " ")
    firstName = name[1]
    tookMoney = $3 + $4 + $5
    print firstName, "(1)$" tookMoney 
	}
  

{
	if ($5 > 10 && $5 < 200){
		print $1, "(2)$" $5
		}
}

END { 
    average = ($3 + $4 + $5) / 3
    if (average < 300) {
        print $1, "(3)$" average
    }
}