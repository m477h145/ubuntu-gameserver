#!/bin/bash

screen -S starbound -X stuff "`printf "^C"`"

echo "### Waiting for server to shutdown ###"

sleep 1

echo "### Updating server ###"

sleep 1

cd /home/bot/steamcmd/

./steamcmd.sh +login anonymous +force_install_dir /home/bot/starbound/ +app_update 211820 validate +quit

cd /home/bot/starbound/

echo "### Starting server ###"

sleep 1

sh start.sh
