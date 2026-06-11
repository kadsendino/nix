{ config, pkgs, lib , nixgl , ... }:

{
  home.username = "maximilian";
  home.homeDirectory = "/home/maximilian";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;  # that's all you need


  home.packages = with pkgs; [
    niri
    (config.lib.nixGL.wrap noctalia-shell)
    xwayland-satellite
    wl-clipboard

    fd fzf
    harper
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
