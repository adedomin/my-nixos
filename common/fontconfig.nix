{ config, lib, pkgs, ... }:
  
let
  cfg = config.fontconfig;
in {
  options.fontconfig = {
    enable = lib.mkEnableOption "enable fontconfig settings";
  };

  # If we are using the Desktop Environment stuff, we probably want this as well.
  config = lib.mkIf (cfg.enable || config.de.enable) {
    fonts = {
      fonts = with pkgs; [
        noto-fonts-emoji
        roboto
        roboto-mono
        noto-fonts
        noto-fonts-cjk
      ];
      fontconfig = {
        localConf = ''
          <match target="pattern">
           <test qual="any" name="family"><string>monospace</string></test>
           <edit name="family" mode="append" binding="weak"><string>Noto Color Emoji</string></edit>
          </match>
          <match target="pattern">
           <test qual="any" name="family"><string>serif</string></test>
           <edit name="family" mode="append" binding="weak"><string>Noto Color Emoji</string></edit>
          </match>
          <match target="pattern">
           <test qual="any" name="family"><string>sans-serif</string></test>
           <edit name="family" mode="append" binding="weak"><string>Noto Color Emoji</string></edit>
          </match>
          <match target="font">
            <edit mode="assign" name="autohint"><bool>false</bool></edit>
            <edit mode="assign" name="hinting"><bool>true</bool></edit>
            <edit mode="assign" name="hintstyle"><const>hintslight</const></edit>
            <edit mode="assign" name="rgba"><const>none</const></edit>
            <edit mode="assign" name="antialias"><bool>true</bool></edit>
          </match>
        '';
      };
    };
  };
}
