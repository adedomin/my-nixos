{ pkgs, ... }:

{
  options.password-store = {
    enable = mkEnableOption "Use pass(1)";
  };

  config = {
    programs.password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    };
  };
}
