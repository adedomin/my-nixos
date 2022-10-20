{ config, lib, pkgs, ... }:

{
  imports = [
    ./binbash.nix
    ./password.nix
    ./flakes.nix
    ./boot/firmware.nix
    ./boot/efi.nix
    ./boot/wsl2.nix
    ./tinc.nix
    ./pc/de.nix
  ];


  system.stateVersion = "21.05";

  networking.useDHCP = false;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  environment.systemPackages = with pkgs; [
    wget
    neovim
    htop
    git
    foot
    alacritty # terminals I use, want termcaps
  ];

  nixpkgs.config.allowUnfree = false;

  users.mutableUsers = false;
  users.users.adedomin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = (import ./ssh-keys.nix).users;
    hashedPassword = config.required.password;
    # hashedPassword = "$6$nixosfuture$r9dQVUIrLEVqnKyLIDM90gdmLtxNzmPpocHuYIEQZSZymwzp6HcElKHiNRtShTt32Gkr31k55sqlzvN7aSwq20";
    shell = pkgs.zsh;
  };
  nix.trustedUsers = [ "root" "adedomin" ];
}
