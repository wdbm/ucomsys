# ucomsys

a setup procedure for UCOM

# overview

UCOM is a desktop environment. UCOM-ELI is a launcher that can be used with UCOM. CERN-alias is a set of launchers, icons, fonts and wallpapers that can be used with UCOM. The purpose of `ucomsys` is to set up all of these things in a UCOM installation. It works with a standard Ubuntu installation and, following installation, is accessible from the greeter.

# tree

The structure for the system installation of UCOM is as follows:

```Bash
/usr/share/ucom/
└── CERN-alias
    ├── fonts
    ├── icons
    ├── launchers
    └── wallpaper
```

The structure for user UCOM files could be as follows:

```Bash
/some/user/ucom/
└── user-alias
    ├── fonts
    ├── icons
    ├── launchers
    └── wallpaper
```

# launchers

The format of launchers should be something like the following:

```
#!/usr/bin/env xdg-open

[Desktop Entry]
Encoding=UTF-8
Name=ATLAS_meetings
Exec=/usr/bin/google-chrome http://cern.ch/go/PM9N
Icon=/usr/share/ucom/CERN-alias/icons/ATLAS.svg
Terminal=false
Type=Application
```
