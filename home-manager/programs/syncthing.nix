{ ... }:

{
  options.syncthing = {
    enable = mkEnableOption "Use Syncthing";
  };

  config = {
    services.syncthing.enable = true;
  };
}
