#!/bin/bash

cd /home/bot/spigot/build

echo "Which version would you like to update to? e.g. 1.11.2"
read input

git config --global --unset core.autocrlf
java -jar BuildTools.jar --rev $input

screen -S spigot -X stuff "`printf "say Server Update^M"`"

sleep 1

screen -S spigot -X stuff "`printf "say 3...^M"`"

sleep 1

screen -S spigot -X stuff "`printf "say 2...^M"`"

sleep 1

screen -S spigot -X stuff "`printf "say 1...^M"`"

sleep 1

screen -S spigot -X stuff "`printf "stop^M"`"

sleep 10

rm /home/bot/spigot/spigot.jar

cp /home/bot/spigot/build/spigot.jar /home/bot/spigot/spigot.jar

cd /home/bot/spigot/

sh start.sh
