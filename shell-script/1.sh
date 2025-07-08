#!/bin/bash
touch copy.txt
#check cpu consumption
free -m > copy.txt
echo "############################" >> copy.txt
#check memory consumption
df -h | head -10 >> copy.txt
echo "#############################" >> copy.txt
#check process taken high utilization
ps -ef| tail -10 >> copy.txt
echo "#################################" >> copy.txt

