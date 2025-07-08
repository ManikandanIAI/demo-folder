#!/bin/bash
touch copy.txt
#check cpu consumption
free -m > copy.txt
############################
#check memory consumption
df -h > copy.txt
#############################
#check process taken high utilization
ps -ef > copy.txt
#################################

