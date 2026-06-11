# ~/nix/home-manager/home.nix
{ config, pkgs, nixgl , ... }:

{
  home.username = "maximilian";
  home.homeDirectory = "/home/maximilian";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;  # that's all you need


  home.packages = with pkgs; [
    niri
    (config.lib.nixGL.wrap noctalia-shell)
    xwayland-satellite   # X11-Apps unter niri
    wl-clipboard         # Clipboard (wl-copy / wl-paste)

    fd fzf
    harper
    markdownlint-cli2
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Symlinks: ~/nix/config/* → ~/.config/*
  # xdg.configFile."niri".source = ../config/niri;
  # xdg.configFile."nvim".source  = ../config/nvim;
}
