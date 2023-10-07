#!/usr/bin/env bash

# Stephen Burke 10/06/2023

myalgorithm=(0 1 2 3 5 6 0 1 3 4 5 6 1 2 3 4 6 0 1 2 4 5 6 0 2 3 4 5)
startdays=(0 5 3 2)

days[0]='Sunday'
days[1]='Monday'
days[2]='Tuesday'
days[3]='Wednesday'
days[4]='Thursday'
days[5]='Friday'
days[6]='Saturday'

getyear() {
    echo "Enter a 4 digit year from 1753-9999: "
    read year
    re1='^[0-9999]+$'
    if ! [[ $year =~ $re1 ]] || [[ $year -lt 1753 ]] || [[ $year -gt 9999 ]]; then
    echo "error: not a valid year"
    exit 1
    fi
    prefix=$(echo $year | cut -c1-2)
}

decade() {
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

year() {
    yearcount=0
    for i in {0..99}
    do
        while [[ ${#i} -lt 2 ]] ; do
            i="0${i}"
        done
        x=${myalgorithm[$yearcount]}
        y=$((x+startday))
        if [[ $y -gt 6 ]]; then
            z=$((y % 7))
        else
            z=$y
        fi
        echo "In ${prefix}${i} pi day (3/14) falls on a ${days[$z]}" | grep $year 2> /dev/null 
        if [[ $yearcount -gt 27 ]]; then
            yearcount=1
        else
            yearcount=$((yearcount+1))
        fi
    done
}

pretty() {
    echo "<><><><><><><><><><><><><><><><><><><><><>"
}

getyear
decade
pretty
year
pretty
