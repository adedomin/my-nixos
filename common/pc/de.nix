{ config, pkgs, lib, ... }:

let
  cfg = config.de;
in {
  imports = [
    ./gnome.nix
    ./clion.nix
    ./chromium.nix
    ./audio.nix
    ./touchpad.nix
  ];

  options.de = {
    enable = lib.mkEnableOption "enable desktop environment";
  };

  config = lib.mkIf cfg.enable {
    # vulkan
    hardware.opengl.driSupport = true;
    hardware.opengl.driSupport32Bit = true;

    # Networking
    networking.networkmanager.enable = true;
    users.users.adedomin.extraGroups = [ "networkmanager" ];

    # Printing
    # services.printing.enable = true;
  };
}
