#!/usr/bin/env python3


# # Stephen Burke 10/06/2023 - Gregorian calendar doomsday day-of-the-week calculator


def day(x):
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    return days[x]


def century(y):
    startdays = [0, 5, 3, 2]
    centurycounter = 0
    for i in range(17, 21):
        if y == i:
            return startdays[centurycounter]
        centurycounter = centurycounter + 1


try:
    year = int(input('Enter a 4 digit year between 1700 & 2099:'))
    if len(str(year)) == 4:
        year = str(year)
        cen, dec = year[:len(year)//2], year[len(year)//2:]
        cen, dec = int(cen), int(dec)
        c = century(cen)
        dotw = int(dec/4+dec+c)%7
        print("In", year, "pi day (3/14) falls on a", day(dotw) + ".")
except:
    print("Error: Only excepts years between 1700 & 2099")
     
