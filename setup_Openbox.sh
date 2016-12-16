#!/bin/bash

# Install prerequisites.
sudo apt-get -y install openbox
sudo apt-get -y install python-docopt
sudo apt-get -y install python-xlib
sudo apt-get -y install xphoon
sudo apt-get -y install maximus
sudo apt-get -y install geany
sudo apt-get -y install firefox
sudo apt-get -y install ranger
sudo apt-get -y install pcmanfm
sudo apt-get -y install cmus
sudo apt-get -y install xvkbd
sudo apt-get -y install xdotool
sudo apt-get -y install redshift
sudo apt-get -y install python-pip
sudo pip install propyte
sudo pip install pyfiglet
sudo pip install pyprel
sudo pip install shijian
sudo pip install technicolor

# Install UCOM and UCOM-ELI.
sudo mkdir -p /usr/share/ucom
cd /usr/share/ucom
sudo wget -N https://raw.githubusercontent.com/wdbm/ucom/master/ucom.py
sudo wget -N https://raw.githubusercontent.com/wdbm/pyrecon/master/pyrecon.py
sudo wget -N https://raw.githubusercontent.com/wdbm/ucom-eli/master/ucom-eli.py
sudo wget -N https://raw.githubusercontent.com/wdbm/monx/master/monx.py
sudo wget -N https://raw.githubusercontent.com/wdbm/monx/master/configuration_snap.md
sudo wget -N https://raw.githubusercontent.com/wdbm/snap/master/snap.py

# Install CERN-alias.
cd /usr/share/ucom
sudo git clone https://github.com/wdbm/CERN-alias.git

# Set up UCOM OpenBox startup applications.
IFS= read -d '' startup_applications << "EOF"
/usr/bin/python /usr/share/ucom/ucom-eli.py --configuration=/usr/share/ucom/CERN-alias/configuration/configuration_ucom.md
#/usr/bin/python /usr/share/ucom/monx.py --configuration=/usr/share/ucom/configuration_snap.md
EOF
sudo bash -c "echo \"${startup_applications}\" > /etc/xdg/openbox/autostart"

# Set up UCOM session launcher.
IFS= read -d '' session_launcher << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=UCOM
Comment=UCOM -- X11 desktop environment
Exec=/usr/bin/openbox-session
Type=Application
EOF
sudo bash -c "echo \"${session_launcher}\" > /usr/share/xsessions/UCOM.desktop"

echo "setup complete"
echo "Restart to use UCOM."
