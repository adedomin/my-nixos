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

  networking.hostName = "adedominic-Precision-5530";
  networking.firewall.allowedUDPPorts = [ 655 ];
  networking.firewall.allowedTCPPorts = [ 22 655 ];
  networking.useDHCP = false;
  # networking.interfaces.enp58s0u1u4.useDHCP = true;
  networking.interfaces.wlp59s0.useDHCP = true;

  required.password = "$6$pNyQ55iiotfG6IFS$oGMaxCZUhLHsvcA21zeTFz6UB7lNpm0CFiASOit8epSvUxOHjAM7bEL4/QaiiM3NeYGBc3zwSptVK2tm4eCj71";

  tinc.enable = true;

  home-manager.users.adedomin.git.email = "adedominic@veeder.com";
}

