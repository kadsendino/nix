# Nix
The nix configuration for my setup.

## Installing Nix

Installing the Nix package-manager can be done using the following command:

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
sh -s -- install
```

## Activate Flakes

```
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Home Manager

```
nix run home-manager/master -- init --switch
```

