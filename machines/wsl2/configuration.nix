{ config, pkgs, ... }:

{
  home.username = "adedomin";
  home.homeDirectory = "/home/adedomin";
  home.stateVersion = "22.11"
  programs.home-manager.enable = true;
  home-manager.users.adedomin.git.email = "adedomin@gmail.com";
}
