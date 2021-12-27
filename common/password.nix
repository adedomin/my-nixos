{ config, lib, pkgs, ... }:

{
  options.required = {
    password = lib.mkOption {
      type = lib.types.str;
      description = "crypt(3) password string. You can use `openssl passwd -6`";
    };
  };
}
