
weirdrange=(0 1 2 3 5 6 0 1 3 4 5 6 1 2 3 4 6 0 1 2 4 5 6 0 2 3 4 5)
count=0

echo "Enter a 4 digit year from 1900-2099: "

read year
echo "<><><><><><><><><><><><><><><><><><><>"

days[0]='Sunday'
days[1]='Monday'
days[2]='Tuesday'
days[3]='Wednesday'
days[4]='Thursday'
days[5]='Friday'
days[6]='Saturday'

if [[ $year -gt 1899 ]] && [[ $year -lt 2000 ]]; then
  startday=3
  prefix=19
elif [[ $year -gt 1999 ]] &&  [[ $year -lt 2100 ]]; then
  startday=2
  prefix=20
fi

for i in {0..99}
do
    while [[ ${#i} -lt 2 ]] ; do
        i="0${i}"
    done
    x=${weirdrange[$count]}
    y=$((x+startday))
    if [[ $y -gt 6 ]]; then
        z=$((y % 7))
    else
        z=$y
    fi
    echo "In ${prefix}${i} pi day (3/14) was on a ${days[$z]}" | grep $year 2> /dev/null 
    if [[ $count -gt 27 ]]; then
        count=1
    else
        count=$((count+1))
    fi
done
echo "<><><><><><><><><><><><><><><><><><><>"
