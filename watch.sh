#!/bin/bash 
coffee -c -b -o static/js -w coffee 2>&1 > log/coffee.log & 
PID1=$!
compass watch 2>&1 > log/compass.log & 
PID2=$!
watchr watch.rb 2>&1 > log/haml.log &
PID3=$!
echo "kill $PID1 $PID2 $PID3" > kill.sh