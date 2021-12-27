{ config, lib, pkgs, ... }:

with lib;
{
  options.binbash = {
    enable = mkEnableOption "Include a /bin/bash link in the system.";
  };

  config = {
    system.activationScripts.binbash = if config.binbash.enable
      then ''
        mkdir -m 0755 -p /bin || true
        ln -sfn /run/current-system/sw/bin/bash /bin/.bash.tmp
        mv /bin/.bash.tmp /bin/bash
      '' else ''
        rm /bin/bash
	rmdir /bin || true
      '';
  };
}
