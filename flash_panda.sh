#!/bin/bash
echo "" 
pkill -f boardd
echo "" 
echo -e "\e[44m***** This must be executed using pipenv (ie. cd ~/panda && pipenv run bash flash_panda.sh\e[0m"
echo -e "\e[44m***** the Panda and RPi should be separately powered, and connected via USB-A to USB-A cable\e[0m"
echo "" 
echo ""
sleep 5
lsusb
echo ""
echo -e "\e[44m***** The text above should include 5 USB items, including one similar to this:\e[0m"
echo ""
echo "Bus 001 Device 045: ID bbaa:ddcc    "
echo ""
echo -e "\e[44m***** If there are only 4 items, unplug the panda from the Pi for 10 seconds.\e[0m"
echo -e "\e[44m***** You may also need to remove power from the Panda briefly\e[0m"
echo ""
echo ""
sleep 10
cd ~/panda/board
make clean
PYTHONPATH=~/raspilot make recover
echo ""
echo ""
echo -e "\e[44m***** You should see 2 separate progress bars above that indicate 2 items were flashed\e[0m"
echo ""
echo "Download        [=========================] 100%        12424 bytes"
echo ""
echo -e "\e[44m***** If you only saw 1 progress bar, execute this script again\e[0m"
echo ""
sleep 7
lsusb
echo ""
echo -e "\e[44m***** The text above should include 5 USB items\e[0m"
echo -e "\e[44m***** If there are only 4 items, unplug the panda from the Pi for 10 seconds.\e[0m"
echo ""
echo ""
