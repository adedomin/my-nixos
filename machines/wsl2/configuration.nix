{ config, pkgs, nixos-wsl, ... }:

{
  imports = [
    nixos-wsl.nixosModules.wsl
  ];

  binbash.enable = true;
  nix.flakes.enable = true;
  
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "adedomin";
    startMenuLauncher = true;
  }
  wsl2.enable = true;

  home-manager.users.adedomin.git.email = "adedomin@gmail.com";
}
