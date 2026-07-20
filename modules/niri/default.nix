{ config, pkgs, lib, nixgl, ... }:
{
  # PAM authentication fix for non-NixOS (lock screen auth via noctalia/quickshell)
  pamShim.enable = true;

  home.packages = with pkgs; [
    niri
    (config.lib.nixGL.wrap (config.lib.pamShim.replacePam noctalia-shell))
    (config.lib.nixGL.wrap xwayland-satellite)
  ];
}
