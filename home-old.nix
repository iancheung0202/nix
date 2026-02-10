{ config, pkgs, ... }:

{
  # 1. Add the import here (this is an example path, adjust based on your setup)
  # imports = [
  #   inputs.plasma-manager.homeManagerModules.plasma-manager
  # ];

  home.username = "iancheung";
  home.homeDirectory = "/home/i/ia/iancheung";
  home.stateVersion = "25.11"; 

  home.packages = [
    pkgs.whitesur-kde
    pkgs.whitesur-icon-theme
  ];

  # This only works if plasma-manager is imported above!
  programs.plasma = {
    enable = true; 
    overrideConfig = true;
    workspace = {
      lookAndFeel = "com.github.vinceliuice.WhiteSur-dark";
      iconTheme = "WhiteSur";
      wallpaper = "${./wallpaper.jpg}";
    };
  };

  programs.home-manager.enable = true;
}
