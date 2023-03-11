{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, ... }: {

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
              }
            ];
            specialArgs = {
              input-nixpkgs = nixpkgs;
              # if using wsl, configs can use it from args.
              inherit nixos-wsl;
            };
          };
      in
        {
          adedominic-Precision-5530 = mkSystem "x86_64-linux" nixpkgs ./machines/adedominic-Precision-5530/configuration.nix;
          smooth-operator = mkSystem "x86_64-linux" nixpkgs ./machines/smooth-operator/configuration.nix;
          wsl-os = mkSystem "x86_64-linux" nixpkgs ./machines/wsl2/configuration.nix
        };

    # This is primarily for environments like Windows, macOS or other linux distros.
    # homeConfigurations =
    #   let
    #     mkHome = system: nixpkgs: cpath: home-manager.lib.homeManagerConfiguration {
    #         pkgs = nixpkgs.legacyPackages.${system};
    #         modules = [
    #           cpath
    #           ./home-manager/adedomin.nix
    #         ];
    #       };

    #   in
    #     {
    #       wsl = mkHome "x86_64-linux" nixpkgs ./machines/wsl2/configuration.nix;
    #     };

    # # This allows running `nix run .#home-manager switch -- --flake .#${name}`
    # home-manager = home-manager.defaultPackage.x86_64-linux;
  };
}
