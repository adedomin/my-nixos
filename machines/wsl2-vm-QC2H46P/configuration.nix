{ config, pkgs, ... }:

{
  nix.flakes.enable = true;

  # this is WSLv2, no bootloader to configure.
  # efi.enable = true;
  # firmware.x86_64.enable = true;

  binbash.enable = true;

  networking.hostName = "DESKTOP-QC2H46P";
  # networking.firewall.allowedUDPPorts = [ 655 ];
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.useDHCP = false;
  # networking.interfaces.eth0.useDHCP = true;

  required.password = "$6$aw6VMD7z/LRTYFYb$YyQsK.hTvRLP3JWmaKVMAhnUJyfiWP0epku7QbzhYR82SEe7EBmsTiKbttrijzn3FmyHCurAAvQRg98QsJMfM.";

  home-manager.users.adedomin.git.email = "adedomin@gmail.com";
}
