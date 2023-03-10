{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
  };

  outputs = { nixpkgs, home-manager, ... }: {

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
            specialArgs = { input-nixpkgs = nixpkgs; };
          };
      in
      {
        adedominic-Precision-5530 = mkSystem "x86_64-linux" nixpkgs ./machines/adedominic-Precision-5530/configuration.nix;
        smooth-operator = mkSystem "x86_64-linux" nixpkgs ./machines/smooth-operator/configuration.nix;
      };
    homeConfigurations = {
      wsl2 = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./machines/wsl2/configuration.nix
          ./home-manager/adedomin.nix
        ];
      };
    };
  };
}
