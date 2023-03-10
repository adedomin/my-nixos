{ config, pkgs, ... }:

{
  config = {
    home.username = "adedomin";
    home.homeDirectory = "/home/adedomin";

    # options here, don't need any prefix, just <option>.etc = unlike nix-os configs.
    git.email = "adedomin@gmail.com";
  };
}
