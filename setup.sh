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

# Install UCOM and UCOM-ELI.
mkdir -p ~/ucomsys
cd ~/ucomsys
wget https://raw.githubusercontent.com/wdbm/ucom/master/ucom.py
wget https://raw.githubusercontent.com/wdbm/pyrecon/master/pyrecon.py
wget https://raw.githubusercontent.com/wdbm/ucom-eli/master/ucom-eli.py
wget https://raw.githubusercontent.com/wdbm/ucomsys/master/configuration.md

## Set up UCOM launch script.
IFS= read -d '' sessionScript << "EOF"
#!/bin/bash
/usr/bin/python ~/ucomsys/ucom.py &
/usr/bin/python ~/ucomsys/ucom-eli.py --configuration ~/ucomsys/configuration.md
EOF
echo "${sessionScript}" > ~/ucomsys/ucomsys.sh
chmod 755 ~/ucomsys/ucomsys.sh

# Set up UCOM session launcher.
IFS= read -d '' sessionLauncher << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=UCOM
Comment=UCOM - X11 desktop environment
Exec=/bin/bash ${HOME}/ucomsys/ucomsys.sh
Type=Application
EOF
#Exec=/usr/bin/python ${HOME}/ucomsys/ucom.py
sudo bash -c "echo \"${sessionLauncher}\" > /usr/share/xsessions/UCOM.desktop"

echo "setup complete"
echo "Restart to use UCOM."
