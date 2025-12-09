# proton-cachyos-v4-nix
Personal NUR for Proton-CachyOS x86-64 v4

This is made for personal use, but I've made the repo public for anyone that may not want to maintain their own. My only intent was to maintain grabbing the x86-64 v4 microarchitecture of proton-cachyos.
I could stop maintaining this for myself at any point.

Enable this repo in your flake.nix inputs using `proton-cachyos.url = "github:powerofthe69/proton-cachyos-v4-nix";`.

Enable the overlay using `nixpkgs.overlays = [ proton-cachyos.overlays.default ];`.

Download the package by adding `programs.steam.extraCompatPackages = with pkgs; [ proton-cachyos ];`.
