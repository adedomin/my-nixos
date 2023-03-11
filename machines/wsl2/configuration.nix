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

  required.password = "$6$tybqoFUtJoqxmVHZ$/IO40qvuHqccLIr/OGqkWFA8q0rTjeiUhO1yNyT.Moobphmn/g9oByXNbALvDwo9M1rk4R.jBPFc3RuZDZLXH/"
  home-manager.users.adedomin.git.email = "adedomin@gmail.com";
}
