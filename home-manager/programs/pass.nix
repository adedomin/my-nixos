{ config, pkgs, lib, ... }:

let
  cfg = config.password-store;
in
{
  options.password-store = {
    enable = lib.mkEnableOption "Use pass(1)";
  };

  config = lib.mkIf cfg.enable {
    programs.password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    };
  };
}
