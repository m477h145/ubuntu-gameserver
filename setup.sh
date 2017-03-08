#!/bin/bash

apt-get install git screen -y

echo "Please type in the Password for the bot account."
sleep 5
adduser bot

cd /home/bot/
su bot

echo "What would you like to do?"
echo ""
echo "(1) Install Minecraft"
echo "(2) Install Spigot"
echo "(3) Install SteamCMD"
echo "(4) Install Starbound [Requires SteamCMD to be installed first]"
echo "(5) Install TeamSpeak3"
echo "(Q) Quit"

read option

if [$option == "1"]; then
  mkdir minecraft
  cd mineraft
  git clone git://github.com/m477h145/.git
fi

if [$option == "2"]; then
  mkdir spigot
  cd spigot
  git clone git://github.com/m477h145/.git
fi

if [$option == "3"]; then
  mkdir steamcmd
  cd steamcmd
fi

if [$option == "4"]; then
  mkdir starbound
  cd starbound
  git clone git://github.com/m477h145/.git
fi

if [$option == "5"]; then
  mkdir ts3server
  cd ts3server
fi

if [$option == "Q" || $option == "q"]; then
  echo "Quitting Script"
fi
