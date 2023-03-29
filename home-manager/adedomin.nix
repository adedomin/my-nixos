{ config, lib, pkgs, ... }:

{
  imports = [
    programs/dconf.nix
    programs/firefox.nix
    programs/foot.nix
    programs/pass.nix
    programs/syncthing.nix
    programs/zsh.nix
    programs/emacs.nix
  ];

  options.git = {
    email = lib.mkOption {
      type = lib.types.str;
      description = "git: email to put on commits.";
    };
  };

  config = {
    home.stateVersion = "22.11";
    programs.git = {
      enable = true;
      userName = "Anthony DeDominic";
      userEmail = config.git.email;

      aliases = {
        check = "checkout";
        st = "status";
        log-files = "log --name-status";
        merge-bisect = "merge --no-commit --no-ff";
      };

      lfs = {
        enable = true;
      };

      extraConfig = {
        pull.rebase = true;
        checkout.defaultRemote = "origin";
        init.defaultBranch = "release";
        core.editor = "${pkgs.neovim}/bin/nvim";
      };

      attributes = [
        "merge renameLimit=50000"
      ];
    };
  };
}
