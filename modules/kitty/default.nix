{ config, pkgs, lib, nixgl, ... }:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap kitty)
    fish
  ];
}
