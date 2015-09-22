#!/bin/bash

# Install prerequisites.
sudo apt-get -y install python-docopt
sudo apt-get -y install python-xlib
sudo apt-get -y install xphoon
sudo apt-get -y install geany
sudo apt-get -y install firefox
sudo apt-get -y install ranger
sudo apt-get -y install cmus
sudo apt-get -y install xvkbd
sudo apt-get -y install xdotool

# Install UCOM and UCOM-ELI.
sudo mkdir -p /usr/share/ucom
cd /usr/share/ucom
sudo wget -N https://raw.githubusercontent.com/wdbm/ucom/master/ucom.py
sudo wget -N https://raw.githubusercontent.com/wdbm/pyrecon/master/pyrecon.py
sudo wget -N https://raw.githubusercontent.com/wdbm/ucom-eli/master/ucom-eli.py
sudo wget -N https://raw.githubusercontent.com/wdbm/snap/master/snap.py
sudo wget -N https://raw.githubusercontent.com/wdbm/ucomsys/master/configuration.md

# Install CERN-alias.
cd /usr/share/ucom
sudo git clone https://github.com/wdbm/CERN-alias.git
#cd /usr/share/ucom/CERN-alias
#sudo rm LICENSE
#sudo rm README.md

# Set up UCOM launch script.
IFS= read -d '' sessionScript << "EOF"
#!/bin/bash
/usr/bin/python /usr/share/ucom/ucom.py &
/usr/bin/python /usr/share/ucom/ucom-eli.py --configuration=/usr/share/ucom/configuration.md
/usr/bin/python /usr/share/ucom/snap.py --configuration=/usr/share/ucom/configuration.md
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

echo "setup complete"
echo "Restart to use UCOM."
