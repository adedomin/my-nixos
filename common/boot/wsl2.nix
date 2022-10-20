{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.wsl2;
in
{
  options.wsl2 = {
    enable = mkEnableOption "Enable wsl2 boot, as in, do nothing.";
  };

  config = mkIf cfg.enable {
    boot.loader.grub.device = "nodev";
  };
}
