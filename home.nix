{ config, pkgs, lib , nixgl, spotify-visualizer , ... }:

{
  home.username = "maximilian";
  home.homeDirectory = "/home/maximilian";
  home.stateVersion = "26.05";

  home.activation.symlinkDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.config

    rm -rf ~/.config/nvim
    ln -sfn $HOME/nix/config/nvim     $HOME/.config/nvim
    ln -sfn $HOME/nix/config/noctalia $HOME/.config/noctalia
    ln -sfn $HOME/nix/config/niri     $HOME/.config/niri
    ln -sfn $HOME/nix/config/kitty    $HOME/.config/kitty
    ln -sfn $HOME/nix/config/fish     $HOME/.config/fish
  '';

  nixpkgs.config.allowUnfree = true;

  #necessary for nixGL 
  targets.genericLinux.nixGL.packages = nixgl.packages;

  # home.packages = with pkgs; [
  # ];

  imports = [
    ./modules/nvim
    ./modules/niri
    ./modules/kitty
  ];
}
