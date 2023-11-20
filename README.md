# The Doomsday Algorithm

Usage:
```
./pi-day-calc.py

Enter a 4 digit year between 1700 & 2099: 2084

<><><><><><><><><><><><><><><><><><><><><>
In 2084 pi day (3/14) falls on a Tuesday.
<><><><><><><><><><><><><><><><><><><><><>

```


## The Math Involved

The crux of the thing is ```(ˣ⁄₄ + x) mod 7 - (ˣ⁄₄ + x) mod 1``` with adjustments needed for the starting position day of each century. Those repeatedly rotate through ```[0, 5, 3, 2]``` with 0 being Sunday.

Example (century starting position day):
```
0 Sunday - 1700's
5 Friday - 1800's
3 Wednesday - 1900's
2 Tuesday - 2000's
0 Sunday - 2100's
5 Friday - 2200's
```

In Python:
```
>>> x=91
>>> int((x/4+x)%7-(x/4+x)%1)
1
```
So for 1991 (91) it would return "1". Add that to it's century start day of Wednesday(3) and you'd get "4". 
```
0 Sunday
1 Monday
2 Tuesday
3 Wednesday
4 Thursday
5 Friday
6 Saturday
```
3/14/1991 was on a Thursday!


```- sb :)```
 
