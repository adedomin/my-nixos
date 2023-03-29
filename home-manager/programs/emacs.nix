{ config, lib, dot-files, ... }:

let
  cfg = config.emacs;
in {
  options = {
    emacs.enable = lib.mkEnableOption "Install emacs for user";
  };

  config = lib.mkIf cfg.enable {
      home.file = {
        "${config.xdg.configHome}/emacs/init.el" = {
          source = "${dot-files}/.config/emacs/init.el";
          target = "${config.xdg.configHome}/emacs/init.el";
        };
      };
    };
}
