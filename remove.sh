#!/bin/bash

# Uninstall UCOM, UCOM-ELI and UCOM launch script.
sudo rm -rf /usr/share/ucom

# Remove UCOM session launcher.
sudo rm /usr/share/xsessions/UCOM.desktop

echo "remove complete"
