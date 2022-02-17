# step 1
```
./scanner.sh 192.168.1 > ips.txt
```
# step 2
```
for ip in $(cat ips.txt;) do nmap $ip; done
```
