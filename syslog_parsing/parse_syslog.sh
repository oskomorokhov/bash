# find the device with most downed interfaces
cat syslog.log | grep 'changed state to down' | sort -k 6 | head -n 1 | awk '{print }'
