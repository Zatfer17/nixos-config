{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      (import "${home-manager}/nixos")
      ./system/common.nix
      ./system/services.nix
      ./system/packages.nix
      ./system/users.nix
      ./system/graphics.nix
      ./home/zatfer.nix
    ];
}
