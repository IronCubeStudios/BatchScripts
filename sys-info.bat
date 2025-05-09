@echo off


echo .
echo 8""""8                                    8                   
echo 8      e    e eeeee eeeee eeee eeeeeee    8  eeeee eeee eeeee 
echo 8eeeee 8    8 8   "   8   8    8  8  8    8e 8   8 8    8  88 
echo     88 8eeee8 8eeee   8e  8eee 8e 8  8    88 8e  8 8eee 8   8 
echo e   88   88      88   88  88   88 8  8    88 88  8 88   8   8 
echo 8eee88   88   8ee88   88  88ee 88 8  8    88 88  8 88   8eee8 
echo .                                                              

set /p "save_or_not=Do you want to save the report or print it? [y/n] "

if /i "%save_or_not%" == "y" (
	echo ==== SYSTEM INFO ==== > system_report.txt
	systeminfo >> system_report.txt
	echo ==== CPU INFO ==== >> system_report.txt
	wmic cpu get name, maxclockspeed, currentclockspeed >> system_report.txt
	echo ==== RAM ==== >> system_report.txt
	wmic memorychip get capacity, speed, manufacturer >> system_report.txt
	echo ==== GPU ==== >> system_report.txt
	wmic path win32_VideoController get name >> system_report.txt
	echo ==== DISK ==== >> system_report.txt
	wmic diskdrive get model, size >> system_report.txt
	start system_report.txt
)

if /i "%save_or_not%" == "n" (
	systeminfo
	wmic cpu get name, maxclockspeed, currentclockspeed
	wmic memorychip get capacity, speed, manufacturer
	wmic path win32_VideoController get name
	wmic diskdrive get model, size
)
