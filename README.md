# proton-cachyos-nix
Personal NUR for Proton-CachyOS

This is made for personal use, but I've made the repo public for anyone that may not want to maintain their own. My original intent was to maintain grabbing the x86-64 v4 microarchitecture of proton-cachyos, but I added all the different microarchitectures too, as I felt like it would be nice to have them for anyone that doesn't want to maintain their own.

I could stop maintaining this for myself at any point.

Enable this repo in your flake.nix inputs using `proton-cachyos.url = "github:powerofthe69/proton-cachyos-nix";`.

Enable the overlay using `nixpkgs.overlays = [ proton-cachyos.overlays.default ];`.

All packages maintain the same structure for installation, that being:
`programs.steam.extraCompatPackages = with pkgs; [ proton-cachyos ];`
`programs.steam.extraCompatPackages = with pkgs; [ proton-cachyos-x86_64_v2 ];`
`programs.steam.extraCompatPackages = with pkgs; [ proton-cachyos-x86_64_v3 ];`
`programs.steam.extraCompatPackages = with pkgs; [ proton-cachyos-x86_64_v4 ];`
