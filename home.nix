{ config, pkgs, lib , nixgl , ... }:

{
  home.username = "maximilian";
  home.homeDirectory = "/home/maximilian";
  home.stateVersion = "26.05";


  # PAM authentication fix for non-NixOS (lock screen auth via noctalia/quickshell)
  pamShim.enable = true;

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

  programs.home-manager.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;

  home.packages = with pkgs; [
    niri
    (config.lib.nixGL.wrap (config.lib.pamShim.replacePam noctalia-shell))
    (config.lib.nixGL.wrap xwayland-satellite)
    (config.lib.nixGL.wrap kitty)
    fish
    swaylock
  ];

  imports = [
    ./modules/nvim
    # ./modules/niri
  ];
}
