{ lib, config, pkgs, ... }:

let
  cfg = config.de;
in {
  config = lib.mkIf cfg.enable {
    # kde plasma
    services.xserver = {
      enable = true;
      layout = "us";
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      desktopManager.gnome.enable = true;
    };

    # gnome3 apps
    services.dbus.packages = [ pkgs.gnome3.dconf ];
    services.udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
    services.gnome.evolution-data-server.enable = true;
    services.gnome.gnome-online-accounts.enable = true;
    users.users.adedomin.packages = with pkgs; [
      # gnome3 apps
      gnome3.eog    # image viewer
      gnome3.evince # pdf reader
      # desktop look & feel
      gnome3.gnome-tweaks
    ];
    # for firefox integration
    services.gnome.gnome-browser-connector.enable = true;

    # Security
    services.gnome.gnome-keyring.enable = true;
    programs.dconf.enable = true;
    programs.gnupg.agent = {
      enable = true;
      pinentryFlavor = "gnome3";
    };
    programs.evolution = {
       enable = true;
       plugins = [ pkgs.evolution-ews ];
    };
    security.pam.services.adedomin.enableGnomeKeyring = true;
    # xdg = {
    #   portal = {
    #     enable = true;
    #     extraPortals = with pkgs; [
    #       xdg-desktop-portal-gtk
    #     ];
    #     gtkUsePortal = true;
    #   };
    # };
  };
}
