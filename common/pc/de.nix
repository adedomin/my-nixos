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

    # font
    #users.users.adedomin.packages = with pkgs; [ roboto roboto-mono ];
    fonts = {
      fonts = with pkgs; [
        noto-fonts-emoji
        (nerdfonts.override { fonts = [ "DroidSansMono" ]; })
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

    # Printing
    # services.printing.enable = true;
  };
}
