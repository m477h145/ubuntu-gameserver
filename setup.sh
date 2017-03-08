#!/bin/bash

apt-get install git screen crontab nano curl -y

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
    echo "Please type in Minecraft Version. e.g 1.11.2"
    read version
    curl -L -O https://s3.amazonaws.com/Minecraft.Download/versions/$version/minecraft_server.$version.jar
    mv minecraft_server.$version.jar minecraft_server.jar
    curl -L -O https://github.com/m477h145/ubuntu-gameserver/raw/master/minecraft/start.sh
    curl -L -O https://github.com/m477h145/ubuntu-gameserver/raw/master/minecraft/update.sh
  echo "Minecraft Server setup complete."
fi

if [$option == "2"]; then
  mkdir spigot
  cd spigot
    mkdir build
    cd build
    curl -L -O https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    echo "Please type in Spigot Version. e.g 1.11.2"
    read version2
    git config --global --unset core.autocrlf
    java -jar BuildTools.jar --rev $version2
    mv spigot-$version2.jar spigot.jar
    cp spigot.jar /home/bot/spigot/spigot.jar
    cd /home/bot/minecraft
    curl -L -O https://github.com/m477h145/ubuntu-gameserver/raw/master/spigot/start.sh
    curl -L -O https://github.com/m477h145/ubuntu-gameserver/raw/master/spigot/update.sh
  echo "Spigot Server setup complete."
fi

if [$option == "3"]; then
  mkdir steamcmd
  cd steamcmd
fi

if [$option == "4"]; then
  mkdir starbound
  cd starbound
  #git clone git://github.com/m477h145/
fi

if [$option == "5"]; then
  mkdir ts3server
  cd ts3server
fi

if [$option == "Q" || $option == "q"]; then
  echo "Quitting Script"
fi
