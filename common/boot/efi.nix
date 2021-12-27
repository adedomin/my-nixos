{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.efi;
in {
  options.efi = {
    enable = mkEnableOption "enable efi boot";
  };

  config = mkIf cfg.enable {
    # Enable microcode
    firmware.x86_64.enable = true;
    # Use GRUB2 for EFI
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 2;
    # a lot of broken usb hubs and devices in this cursed world.
    boot.kernelParams = [ "usbcore.autosuspend=-1" ];
  };
}
