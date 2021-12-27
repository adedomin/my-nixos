{ config, pkgs, fetchurl, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.flakes.enable = true;

  efi.enable = true;
  firmware.x86_64.enable = true;
  
  de.enable = true;
  de.touchpad.enable = true;

  binbash.enable = true;

  networking.hostName = "smooth-operator";
  networking.firewall.allowedUDPPorts = [ 655 ];
  networking.firewall.allowedTCPPorts = [ 22 655 ];
  networking.useDHCP = false;
  # networking.interfaces.enp57s0u1u4.useDHCP = true;
  networking.interfaces.wlp58s0.useDHCP = true;

  required.password = "$6$hjX0SpV69lz2vRJ7$u05zcmWIpmThiI2zxXciettnHPV.npZaW9CDml5m/84/csi0BWVvc4Wql4FYVPRUVn4E9wBISXz4dlbj61wuo1";

  tinc.enable = true;

  home-manager.users.adedomin.git.email = "adedomin@gmail.com";
}

