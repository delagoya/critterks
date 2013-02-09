#!/bin/bash 
coffee -c -b -o static/js -w coffee 2>&1 > log/coffee.log & 
compass watch 2>&1 > log/compass.log & 
watchr watch.rb 2>&1 > log/haml.log &
