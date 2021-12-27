{ config, pkgs, lib, ... }:

let
  cfg = config.clion;
in {
  options.clion = {
    enable = lib.mkEnableOption "enable nonfree CLion IDE";
  };

  config = lib.mkIf cfg.enable {
    users.users.adedomin.packages = [
      pkgs.jetbrains.clion
    ];
  };
}
