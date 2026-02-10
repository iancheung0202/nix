{ config, pkgs, ... }:

{
  home.username = "iancheung";
  home.homeDirectory = "/home/i/ia/iancheung";
  home.stateVersion = "25.11"; 

  home.packages = [
    pkgs.whitesur-kde
    pkgs.whitesur-icon-theme
    pkgs.apple-cursor
    pkgs.whitesur-gtk-theme
  ];

  programs.plasma = {
    enable = true;  
    overrideConfig = true;

    workspace = {
      lookAndFeel = "com.github.vinceliuice.WhiteSur-dark";
      iconTheme = "WhiteSur-dark"; 
      cursor.theme = "macOS";
      wallpaper = "${./wallpaper.jpg}";

    # This is the nested path that should work for your version
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "WhiteSur-dark";
      };
    };

    panels = [
      {
        location = "top";
        height = 30;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.appmenu" 
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    # This forces the macOS button alignment (Close/Min/Max on the left)
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

