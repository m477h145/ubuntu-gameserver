#!/bin/bash

apt-get update
apt-get install git screen crontab nano curl lib32gcc1 software-properties-common libvorbisfile3 bzip2 -y
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer  -y

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
echo "(6) Install custom SteamCMD game"
echo "(Q) Quit"

read option

if [ $option == '1' ];
  then
  mkdir minecraft
  cd mineraft
    mkdir backup
    echo "Please type in Minecraft Version. e.g 1.11.2"
    read version
    curl -L -O "https://s3.amazonaws.com/Minecraft.Download/versions/$version/minecraft_server.$version.jar"
    mv minecraft_server.$version.jar minecraft_server.jar
    curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/minecraft/start.sh"
    curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/minecraft/update.sh"
    curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/minecraft/backup.sh"
  echo "Minecraft Server setup complete."
  sleep 2
fi

if [ $option == '2' ];
  then
  mkdir spigot
  cd spigot
    mkdir backup
    mkdir build
    cd build
    curl -L -O "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
    echo "Please type in Spigot Version. e.g 1.11.2"
    read version2
    git config --global --unset core.autocrlf
    java -jar BuildTools.jar --rev $version2
    mv spigot-$version2.jar spigot.jar
    cp spigot.jar /home/bot/spigot/spigot.jar
    cd /home/bot/spigot
    curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/spigot/start.sh"
    curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/spigot/update.sh"
    curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/spigot/backup.sh"
  echo "Spigot Server setup complete."
  sleep 2
fi

if [ $option == '3' ];
  then
  mkdir steamcmd
  cd steamcmd
  curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
  echo "SteamCMD setup complete"
  sleep 2
fi

if [ $option == '4' ];
  then
  mkdir starbound
  cd /home/bot/steamcmd/
  ./steamcmd.sh +login anonymous +force_install_dir /home/bot/starbound +app_update 211820 validate +quit
  cd /home/bot/starbound
  curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/starbound/start.sh"
  curl -L -O "https://github.com/m477h145/ubuntu-gameserver/raw/master/starbound/update.sh"
  echo "Starbound setup complete"
  sleep 2
fi

if [ $option == '5' ];
  then
  mkdir ts3server
  cd ts3server
  curl -L -O "http://dl.4players.de/ts/releases/3.0.13.6/teamspeak3-server_linux_amd64-3.0.13.6.tar.bz2" | tar xvjf -
  echo "TeamSpeak3 Server setup complete"
  sleep 2
fi

if [ $option == '6' ];
  then
  echo "How should the game folder be called?"
  read folder
  mkdir $folder
  cd /home/bot/steamcmd
    echo "Which game would you like to install? Please type in the AppID.(You can look it up on steamdb.info)"
    read appid
  ./steamcmd.sh +login anonymous +force_install_dir /home/bot/$folder +app_update $appid validate +quit
fi

if [ $option == 'Q' ] || [ $option == 'q' ];
  then
  echo "Quitting Script"
  sleep 2
fi
