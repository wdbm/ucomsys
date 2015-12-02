#!/bin/bash

# Install prerequisites.
sudo apt-get -y install --only-upgrade python-docopt
sudo apt-get -y install --only-upgrade python-xlib
sudo apt-get -y install --only-upgrade xphoon
sudo apt-get -y install --only-upgrade maximus
sudo apt-get -y install --only-upgrade geany
sudo apt-get -y install --only-upgrade firefox
sudo apt-get -y install --only-upgrade ranger
sudo apt-get -y install --only-upgrade pcmanfm
sudo apt-get -y install --only-upgrade cmus
sudo apt-get -y install --only-upgrade xvkbd
sudo apt-get -y install --only-upgrade xdotool
sudo apt-get -y install --only-upgrade redshift
sudo apt-get -y install --only-upgrade python-pip
sudo pip install propyte --upgrade
sudo pip install pyfiglet --upgrade
sudo pip install pyprel --upgrade
sudo pip install shijian --upgrade
sudo pip install technicolor --upgrade

# Install UCOM and UCOM-ELI.
cd /usr/share/ucom
sudo wget -N https://raw.githubusercontent.com/wdbm/ucom/master/ucom.py
sudo wget -N https://raw.githubusercontent.com/wdbm/pyrecon/master/pyrecon.py
sudo wget -N https://raw.githubusercontent.com/wdbm/ucom-eli/master/ucom-eli.py
sudo wget -N https://raw.githubusercontent.com/wdbm/monx/master/monx.py
sudo wget -N https://raw.githubusercontent.com/wdbm/monx/master/configuration_snap.md
sudo wget -N https://raw.githubusercontent.com/wdbm/snap/master/snap.py

# Install CERN-alias.
cd /usr/share/ucom/CERN-alias
sudo git pull

# Set up UCOM launch script.
IFS= read -d '' sessionScript << "EOF"
#!/bin/bash
/usr/bin/python /usr/share/ucom/ucom.py &
/usr/bin/python /usr/share/ucom/ucom-eli.py --configuration=/usr/share/ucom/CERN-alias/configuration/configuration_ucom.md
/usr/bin/python /usr/share/ucom/monx.py --configuration=/usr/share/ucom/configuration_snap.md
EOF
sudo bash -c "echo \"${sessionScript}\" > /usr/share/ucom/ucomsys.sh"
sudo chmod 755 /usr/share/ucom/ucomsys.sh

# Set up UCOM session launcher.
IFS= read -d '' sessionLauncher << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=UCOM
Comment=UCOM -- X11 desktop environment
Exec=/bin/bash /usr/share/ucom/ucomsys.sh
Type=Application
EOF
sudo bash -c "echo \"${sessionLauncher}\" > /usr/share/xsessions/UCOM.desktop"

echo "update complete"
echo "Restart to use UCOM."
