#!/bin/bash

i=0
while true;
do
    curl -o /dev/null -s localhost:8080
    if [ $? -ne 0 ]
    then

	echo "=====||| $(date) ||| logs syslog ===" >> erro.txt
	tail -n10 /var/log/syslog >> erro.txt
	echo "============ final syslog ============" >> erro.txt
	echo "======= ||| $(date) ||| logs dmesg" >> erro.txt
	dmesg | tail -n20 >> erro.txt
	echo "===== final do log dmesg ====" >> erro.txt
	break
    fi
    i=$(($i+1))
    echo -en "$i        \r"
    sleep 1
done
