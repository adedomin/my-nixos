{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
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
      smooth-operator= mkSystem "x86_64-linux" nixpkgs ./machines/smooth-operator/configuration.nix;
    };
  };
}
