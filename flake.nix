{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, ... }: {

    nixosConfigurations =
      let
        mkSystem = system: nixpkgs: path:
          nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
              path
              nixos-wsl.nixosModules.wsl
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
        wsl2-vm-QC2H46P = mkSystem "x86_64-linux" nixpkgs ./machines/wsl2-vm-QC2H46P/configuration.nix;
      };
  };
}
