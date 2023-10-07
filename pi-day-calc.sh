#!/usr/bin/env bash

# Stephen Burke 10/06/2023

days[0]='Sunday'
days[1]='Monday'
days[2]='Tuesday'
days[3]='Wednesday'
days[4]='Thursday'
days[5]='Friday'
days[6]='Saturday'

getyear() {
    echo -n "Enter a 4 digit year from 1753-9999: "
    read year
    re1='^[0-9999]+$'
    if ! [[ $year =~ $re1 ]] || [[ $year -lt 1753 ]] || [[ $year -gt 9999 ]]; then
        echo "error: not a valid year"
        exit 1
    fi
    prefix=$(echo $year | cut -c1-2)
}

decade() {
    startdays=(0 5 3 2)
    decadecounter=0
    for ii in {17..99}
    do
        xx=${startdays[$decadecounter]}
        zz=$(echo $ii $xx | grep $prefix | awk '{print $2}')
        re='^[0-9]+$'
        if [[ $zz =~ $re ]] ; then
            startday=$(echo $ii $xx | grep $prefix | awk '{print $2}')
        fi
        decadecounter=$((decadecounter+1))
        if [[ $decadecounter -gt 3 ]]; then
            decadecounter=0
        fi
    done    
}

day() {
    lasttwo=$(echo $year | cut -c3-4)
    leapyears=$((lasttwo / 4))
    y=$(((lasttwo + leapyears + startday) % 7))
    echo "In ${year} pi day (3/14) falls on a ${days[$y]}"
}

pretty() {
    echo "<><><><><><><><><><><><><><><><><><><><><>"
}

getyear
decade
pretty
day
pretty
 
