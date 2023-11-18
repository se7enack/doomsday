# The Doomsday Algorithm

Usage:
```
./pi-day-calc.py

Enter a 4 digit year between 1700 & 2099: 2084

<><><><><><><><><><><><><><><><><><><><><>
In 2084 pi day (3/14) falls on a Tuesday.
<><><><><><><><><><><><><><><><><><><><><>
```

The crux of the whole thing is ```int(x/4+x)%7``` with some adjustments for leap years and the starting position day for each year. Those rotate in a ```0, 5, 3, 2``` with 0 being Sunday. 
