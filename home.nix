{ config, pkgs, ... }:

{
  home.username = "iancheung";
  home.homeDirectory = "/home/i/ia/iancheung";
  home.stateVersion = "25.11";

  # Remove all contents from ~/Desktop
  home.activation.clearDesktop = config.lib.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD rm -rf ${config.home.homeDirectory}/Desktop/*
  '';

  # Set ~/remote as true desktop
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/remote";
    download = "${config.home.homeDirectory}/remote";
  };

  home.packages = [
    pkgs.whitesur-kde
    pkgs.whitesur-icon-theme
    pkgs.apple-cursor
    pkgs.whitesur-gtk-theme
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    desktop.mouseActions.rightClick = "contextMenu";

    workspace = {
      lookAndFeel = "com.github.vinceliuice.WhiteSur-dark";
      iconTheme = "WhiteSur-dark";
      cursor.theme = "macOS";
      wallpaper = "${./wallpaper.jpg}";

      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "WhiteSur-dark";
      };
    };

    panels = [
      {
        location = "top";
        height = 35;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
      {
        location = "bottom";
        height = 64;
        alignment = "center";
        lengthMode = "fit";
        floating = true;
        hiding = "none"; # autohide
        widgets = [
          {
            iconTasks = {
              launchers = [
                "applications:org.gnome.Nautilus.desktop"    # Finder
                "applications:xfce4-web-browser.desktop"     # Safari
                "applications:google-chrome.desktop"         # Chrome
                "applications:firefox.desktop"               # Firefox
                "applications:org.kde.kate.desktop"          # Kate
                "applications:Zoom.desktop"                  # Zoom
                "applications:org.inkscape.Inkscape.desktop" # Inkscape
                "applications:idea-oss.desktop"              # IntelliJ
                "applications:code.desktop"                  # VS Code
                "applications:systemsettings.desktop"        # Settings
                "applications:org.kde.kwrite.desktop"        # Text Editor
                "applications:org.kde.konsole.desktop"       # Terminal
                "applications:xfce4-taskmanager.desktop"     # Task Manager
              ];
            };
          }
          # {
            # name = "org.kde.plasma.folder";
            # config = {
              # General = {
                # url = "file:///home/i/ia/iancheung/remote";
                # label = "Remote";
              # };
            # };
          # }
          # "org.kde.plasma.icontasks" # Recently Used
          # "org.kde.plasma.trash"       # Trash
        ];
      }
    ];

    configFile."kwinrc"."org.kde.kwin"."titlebarButtonsLeft" = "XAI";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };

  programs.home-manager.enable = true;
}
