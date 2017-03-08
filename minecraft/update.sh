#!/bin/bash

cd /home/bot/minecraft/

echo "Which version would you like to update to? e.g. 1.11.2"
read input

screen -S minecraft -X stuff "`printf "say Server Update^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "say 3...^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "say 2...^M"`"

sleep 1

screen -S minecraft -X stuff "`printf "say 1...^M"`"

sleep 1

screen -S mineraft -X stuff "`printf "stop^M"`"

sleep 10

rm /home/bot/minecraft/minecraft_server.jar

curl -L -O https://s3.amazonaws.com/Minecraft.Download/versions/$input/minecraft_server.$input.jar

mv minecraft_server.$input.jar minecraft_server.jar

sh start.sh
