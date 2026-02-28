@echo off
IF NOT EXIST reports mkdir reports
del /q log.html report.html output.xml 2>nul
robot --outputdir reports/ robot-catfact-api/tests/breeds_tests.robot
pause