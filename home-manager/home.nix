# ~/nix/home-manager/home.nix
{ config, pkgs, ... }:

{
  home.username = "maximilian";
  home.homeDirectory = "/home/maximilian";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    niri
    noctalia-shell
    xwayland-satellite   # X11-Apps unter niri
    fuzzel               # App Launcher
    mako                 # Benachrichtigungen
    wl-clipboard         # Clipboard (wl-copy / wl-paste)
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Symlinks: ~/nix/config/* → ~/.config/*
  xdg.configFile."niri".source = ../config/niri;
  xdg.configFile."nvim".source  = ../config/nvim;
}
