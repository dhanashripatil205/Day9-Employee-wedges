#!/bin bash -x

#Start with Displaying Welcome to Employee Wage Computation Program on Master Branch
#Check Employee is Present or Absent - Use ((RANDOM)) for Attendance Check
#Calculate Daily Employee Wage
#Add Part time Employee & Wage - Assume Part time Hour is 8
#Solving using Switch Case Statement
#Calculating Wages for a Month - Assume 20 Working Day per Month
#Calculate Wages till a condition of total working hours or days is reached for a month - Assume 100 hours and 20 days
#Refactor the Code to write a function to get work hours
#Store the Daily Wage along with the Total Wage
#Store the Day and the Daily Wage along with the Total Wage


echo "Welcome to Employee Wage Computation Program"
declare -a dailyWage
isPartTimePresent=2
isFullTimePresent=1
isAbsent=0
wagePerHour=20
workingDays=20
maxHrsInMonth=100
monthSalary=0
totalWorkingHr=0
function getWorkingHours() {
	case $empCheck in

		$isFullTimePresent)
			workingHr=8;;

		$isPartTimePresent)
			workingHr=4;;

		*)
			workingHr=0;;
	esac
	echo $workingHr
}

for (( i=0; i<$workingDays && $totalWorkingHr<$maxHrsInMonth; i++ ))
do
	empCheck=$((RANDOM%3))
	workingHr="$( getWorkingHours $empCheck )"
	dailyWage[i]=$((workingHr*wagePerHour))
	totalWorkingHr=$((totalWorkingHr+workingHr))
	echo "Day$((i+1)) wage: ${dailyWage[i]}"
done
echo "Daily wage : ${dailyWage[@]}"
monthSalary=$((wagePerHour*totalWorkingHr))
echo "Employee monthly wage : $monthSalary"
