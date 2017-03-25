#!/bin/bash

cd /home/bot/spigot/

screen -S spigot -X stuff "`printf "say Server Backup^M"`"

sleep 1

screen -S spigot -X stuff "`printf "say 3^M"`"

sleep 1

screen -S spigot -X stuff "`printf "say 2^M"`"

sleep 1

screen -S spigot -X stuff "`printf "1^M"`"

sleep 1

screen -S spigot -X stuff "`printf "stop^M"`"

sleep 20

zip -r /home/bot/spigot/backup/backup-$(date +%d.%m.%y).zip world/

sh /home/bot/spigot/start.sh
