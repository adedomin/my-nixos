{ lib, config, pkgs, ... }:

let
  cfg = config.de;
in {
  config = lib.mkIf cfg.enable {
    # chromium with specific extensions + settings
    programs.chromium = {
      enable = true;
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
        "hkgfoiooedgoejojocmhlaklaeopbecg" # picture in picture
        "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
        "gphhapmejobijbbhgpjhcjognlahblep" # GNOME Extension
      ];
      extraOpts = {
        "BrowserSignin" = 0;
        "SyncDisabled" = true;
        "PasswordManagerEnabled" = true;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [ "en-US" ];
        "BlockThirdPartyCookies" = true;
      };
    };
    environment.systemPackages = with pkgs; [
      chromium
    ];
  };
}
