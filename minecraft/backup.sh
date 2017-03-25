#!/bin/bash

cd /home/bot/minecraft/

screen -S minecraft -X stuff "`printf "say Server Backup^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "say 3^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "say 2^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "1^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "stop^M"`"

sleep 20

zip -r /home/bot/minecraft/backup/backup-$(date +%d.%m.%y).zip world/

sh /home/bot/minecraft/start.sh
