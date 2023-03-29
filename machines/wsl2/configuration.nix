{ config, pkgs, nixos-wsl, ... }:

{
  imports = [
    nixos-wsl.nixosModules.wsl
  ];

  binbash.enable = true;
  nix.flakes.enable = true;

  wsl = {
    enable = true;
    defaultUser = "adedomin";
    wslConf = {
      automount.root = "/mnt";
      interop.appendWindowsPath = false;
      network = {
        generateResolvConf = true;
        generateHosts = false;
      };
    };
  };

  wsl2.enable = true;

  networking.hostName = "nixos-wsl2";
  # work template:
  # networking.proxy.default = "http://change-me";
  # networking.proxy.noProxy = ".x,.y.z";
  # Use this if generateResolvConf creates a buggy resolv.conf
  # networking.nameservers = [ 1.1.1.1 ];

  # we will use WSL's (X)Wayland Compositor or VcXsrv but not a fullblown DE
  fontconfig.enable = true;

  required.password = "$6$tybqoFUtJoqxmVHZ$/IO40qvuHqccLIr/OGqkWFA8q0rTjeiUhO1yNyT.Moobphmn/g9oByXNbALvDwo9M1rk4R.jBPFc3RuZDZLXH/";
  home-manager.users.adedomin.git.email = "adedomin@gmail.com";
  home-manager.users.adedomin.xdg.enable = true;
  emacs-git.enable = true;
  home-manager.users.adedomin.emacs.enable = true;
}
