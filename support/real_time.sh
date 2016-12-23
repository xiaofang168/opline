#!/bin/sh
count=1; 
while true; 
do 
	echo "hello, world $count" >> ../out.log; 
	count=$(($count+1)); 
	sleep 1s; 
done