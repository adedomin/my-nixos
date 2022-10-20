{ config, lib, ... }:

let
  cfg = config.syncthing;
in
{
  options.syncthing = {
    enable = lib.mkEnableOption "Use Syncthing";
  };

  config = lib.mkIf cfg.enable {
    services.syncthing.enable = true;
  };
}
