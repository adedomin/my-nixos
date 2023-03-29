{ config, lib, input-nixpkgs, input-system, emacs-overlay, ... }:

let
  cfg = config.emacs-git;
in {
  options = {
    emacs-git.enable = lib.mkEnableOption "Make and install upstream prerelease Emacs.";
  };

  config = lib.mkIf cfg.enable (
    let
      pkgs = import input-nixpkgs { system = input-system; overlays = [ (import emacs-overlay) ]; };
    in {
      environment.systemPackages = [ pkgs.emacsGit ];
    }
  );
}
