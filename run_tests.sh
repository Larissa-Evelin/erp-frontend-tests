#!/bin/bash
mkdir -p reports
rm -f log.html report.html output.xml
robot --outputdir reports robot-catfact-api/tests/breeds_tests.robot
