{ config, pkgs,inputs ,     ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";



  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
   
  ];

  
  home.file = {



  };


  home.sessionVariables = {
    EDITOR = "codium";
  };
wayland.windowManager.hyprland = {
    enable = true ;
    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
    ];
    settings = {
      
    };


  }; 

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
