#!/bin/bash

echo "Welcome to Network Scanner"
echo "scanning your network: 
echo "started at: $(date)"
echo "<====== SCANNING ======>"

# Start scan and save to file
nmap -sn 192.168.94.0/24 | tee results.txt
sleep 2

echo "--------SCAN FINISHED--------"
count=$(grep "Nmap scan report" results.txt | wc -l)
echo ""
echo "______ DEVICE TYPES DETECTED ______"
echo ""
echo "$(grep -A 5 "Nmap scan report" results.txt | grep -E "Nmap scan report|Device type|Running" | sed 's/^/🔍 /')"
echo ""
echo "=================================="
echo "✅  Scan finished at: $(date)"
echo "✅  Hosts found: $count"
echo "=================================="
