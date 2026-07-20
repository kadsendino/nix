{ config, pkgs, lib , nixgl , ... }:

{
  home.username = "maximilian";
  home.homeDirectory = "/home/maximilian";
  home.stateVersion = "26.05";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;

  home.packages = with pkgs; [
    niri
    (config.lib.nixGL.wrap noctalia-shell)
    (config.lib.nixGL.wrap xwayland-satellite)
    wl-clipboard
    (config.lib.nixGL.wrap kitty)
    fish
    swaylock
    fd fzf
    harper
    rust-analyzer
    markdownlint-cli2
    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.activation.symlinkDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.config

    ln -sfn $HOME/nix/config/noctalia $HOME/.config/noctalia
    ln -sfn $HOME/nix/config/niri     $HOME/.config/niri
    ln -sfn $HOME/nix/config/nvim     $HOME/.config/nvim
    ln -sfn $HOME/nix/config/kitty    $HOME/.config/kitty
    ln -sfn $HOME/nix/config/fish     $HOME/.config/fish
  '';

}
