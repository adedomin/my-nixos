{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    emacs-overlay.url = "github:nix-community/emacs-overlay/master";
    dot-files = {
      url = "github:adedomin/dot-files/master";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, dot-files, emacs-overlay, ... }: {
    nixosConfigurations =
      let
        mkSystem = system: nixpkgs: path:
          nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              path
              ./common/common.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.adedomin = import ./home-manager/adedomin.nix;
                # These are all for Emacs setup
                home-manager.extraSpecialArgs = {
                  inherit dot-files;
                };
              }
            ];
            specialArgs = {
              input-system = system;
              input-nixpkgs = nixpkgs;
              # if using wsl, configs can use it from args.
              inherit nixos-wsl;
              inherit emacs-overlay;
            };
          };
      in
        {
          adedominic-Precision-5530 = mkSystem "x86_64-linux" nixpkgs ./machines/adedominic-Precision-5530/configuration.nix;
          smooth-operator = mkSystem "x86_64-linux" nixpkgs ./machines/smooth-operator/configuration.nix;
          # to build initial image for wsl2 import:
          # nix build '.#nixosConfigurations.wsl-os.config.system.build.installer'
          wsl-os = mkSystem "x86_64-linux" nixpkgs ./machines/wsl2/configuration.nix;
        };
  };
}
