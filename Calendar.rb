$totalDays=0
$MonthDays=0

def isleap(year)
    if year%4!=0
        return false
    elsif year%100==0 and year%400!=0
        return false
    else
        return true
    end
end

def getmonth(month, year)
    if month==2
        if isleap year
            $MonthDays=29
        else 
            $MonthDays=28
        end
    else
        if month==4 or month==6 or month==9 or month==11
            $MonthDays=30
        else
            $MonthDays=31
        end
    end
    return $MonthDays
end

def getday(year, month)
    for y in 1900..year-1
        if isleap y
            $totalDays+=366
        else
            $totalDays+=365
        end
    end
    for m in 1..month-1
        if m==2
            if isleap year
                $totalDays+=29
            else
                $totalDays+=28
            end
        else
            if m==1 or m==3 or m==5 or m==7 or m==8 or m==10 or m==12
                $totalDays+=31
            else
                $totalDays+=30
            end
        end
    end
    return $totalDays;
end

def getweekday()
    $totalDays+=1
    return $totalDays%7
end

print "Year:";
year=gets.to_i
print "Month:"
month=gets.to_i

$totalDays=getday(year,month)
$MonthDays=getmonth(month,year)
weekday=getweekday()

puts "Sun\tMon\tTue\tWed\tThu\tFri\tSat"
for i in 0..weekday-1
    print "\t"
end
for j in 1..$MonthDays
    print j,"\t"
    if (weekday+j)%7==0
        print "\n"
    end
end
