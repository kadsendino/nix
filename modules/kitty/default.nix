{ config, pkgs, lib, nixgl, spotify-visualizer , ... }:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap kitty)
    fish
 
    #Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro

    #Terminal Applications
    cava
    pipes
    cbonsai
    fastfetch
    spotify-visualizer.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
