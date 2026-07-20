# Nix

The nix configuration for my setup.

## Installing Nix

Installing the Nix package-manager can be done using the following command:

```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Activate Flakes

```
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Home Manager

```
cd nix
nix run home-manager -- switch --flake .#maximilian
```

## Niri Setup

Create a .desktop file for niri to be able to log in.

```
sudo cp ./files/niri.desktop /usr/share/wayland-sessions/
```

## Eduroam

To use eduroam correctly install it via the python script and then set it global

```
nmcli connection modify eduroam 802-1x.password-flags 0
nmcli connection modify eduroam 802-1x.password "password"
```
