# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  options.dconf = {
    enable = mkEnableOption "Use gnome 3 config";
  };
  config = {
    dconf.settings = {
      "org/gnome/desktop/calendar" = {
        show-weekdate = true;
      };

      "org/gnome/desktop/input-sources" = {
        current = mkUint32 0;
        mru-sources = [ (mkTuple [ "xkb" "us+altgr-intl" ]) (mkTuple [ "xkb" "us" ]) ];
        per-window = false;
        show-all-sources = true;
        sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "us+altgr-intl" ]) ];
        xkb-options = [ "lv3:ralt_switch" ];
      };

      "org/gnome/desktop/interface" = {
        clock-format = "12h";
        clock-show-date = true;
        clock-show-seconds = true;
        clock-show-weekday = true;
        enable-animations = false;
        font-antialiasing = "grayscale";
        font-hinting = "slight";
        gtk-enable-primary-paste = true;
        gtk-im-module = "gtk-im-context-simple";
        gtk-theme = "Adwaita";
        show-battery-percentage = true;
        toolkit-accessibility = false;
      };

      "org/gnome/desktop/peripherals/keyboard" = {
        delay = mkUint32 253;
        numlock-state = true;
        repeat-interval = mkUint32 16;
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/privacy" = {
        disable-microphone = false;
        report-technical-problems = false;
      };

      "org/gnome/desktop/session" = {
        idle-delay = mkUint32 0;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        move-to-workspace-1 = [ "<Shift><Super>exclam" ];
        move-to-workspace-2 = [ "<Shift><Super>at" ];
        move-to-workspace-3 = [ "<Shift><Super>numbersign" ];
        move-to-workspace-4 = [ "<Shift><Super>dollar" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
      };

      "org/gnome/desktop/wm/preferences" = {
        focus-mode = "sloppy";
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
        mic-mute = [ "<Super>F9" ];
        screensaver = [ "<Super>BackSpace" ];
        volume-down = [ "<Super>F11" ];
        volume-mute = [ "<Super>F10" ];
        volume-up = [ "<Super>F12" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "foot";
        name = "Terminal";
      };

      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "interactive";
        sleep-inactive-ac-timeout = 3600;
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
      };

      "org/gnome/shell/extensions/gtile" = {
        animation = false;
        grid-sizes = "4x4";
        preset-resize-1 = [ "" ];
        preset-resize-11 = [ "" ];
        preset-resize-12 = [ "" ];
        preset-resize-13 = [ "" ];
        preset-resize-14 = [ "" ];
        preset-resize-15 = [ "" ];
        preset-resize-16 = [ "" ];
        preset-resize-17 = [ "" ];
        preset-resize-18 = [ "" ];
        preset-resize-19 = [ "" ];
        preset-resize-2 = [ "<Super>r" ];
        preset-resize-21 = [ "" ];
        preset-resize-22 = [ "" ];
        preset-resize-23 = [ "" ];
        preset-resize-24 = [ "" ];
        preset-resize-25 = [ "" ];
        preset-resize-26 = [ "" ];
        preset-resize-27 = [ "" ];
        preset-resize-28 = [ "" ];
        preset-resize-29 = [ "" ];
        preset-resize-3 = [ "<Super>f" ];
        preset-resize-4 = [ "" ];
        preset-resize-5 = [ "" ];
        preset-resize-6 = [ "<Super>d" ];
        preset-resize-7 = [ "<Super>e" ];
        preset-resize-8 = [ "" ];
        preset-resize-9 = [ "" ];
        resize1 = "4x2 0:0 1:1";
        resize2 = "2x2 1:0 1:0";
        resize4 = "4x2 2:0 3:1";
        resize5 = "4x4 0:0 1:1";
        resize6 = "4x4 0:2 1:3";
        show-toggle-tiling = [ "<Super>backslash" ];
        show-toggle-tiling-alt = [ "" ];
      };

      "org/gnome/shell/extensions/system-monitor" = {
        compact-display = true;
        cpu-individual-cores = false;
        cpu-refresh-time = 5000;
        cpu-show-text = false;
        disk-display = true;
        disk-refresh-time = 5000;
        disk-show-text = false;
        fan-sensor-file = "/sys/class/hwmon/hwmon1/fan1_input";
        fan-show-menu = false;
        fan-show-text = false;
        gpu-show-menu = false;
        icon-display = false;
        memory-show-text = false;
        net-refresh-time = 5000;
        net-show-text = false;
        swap-show-text = false;
        thermal-sensor-file = "/sys/class/hwmon/hwmon2/temp1_input";
      };

      "org/gnome/shell/keybindings" = {
        open-application-menu = [ ];
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
      };

      "org/gnome/shell/overrides" = {
        dynamic-workspaces = false;
      };

      "org/gnome/system/location" = {
        enabled = true;
      };

      "org/gnome/tweaks" = {
        show-extensions-notice = false;
      };

    };
  };
}
