{ config, pkgs, lib, ... }:

with lib;
let
  inherit (builtins) head filter replaceStrings;
  netName = "dedominic";
  netSubnet = "fd69:1234:5678::/80";
  cfg = config.tinc;
  peerName = replaceStrings [ "." "-" ] [ "_" "_" ] config.networking.hostName;

  extractIpAddr = key:
    if hosts ? "${key}"
    then removePrefix "Subnet = " (head (filter (hasPrefix "Subnet = ") (splitString "\n" hosts."${key}")))
    else "";

  # Add all of these here.
  hosts = {
    veeder_dev = ''
      Port = 655
      Subnet = fd69:1234:5678::4/128

      -----BEGIN RSA PUBLIC KEY-----
      MIICCgKCAgEAzUoT/hlJV+3AS2bu/xEeGhKri+FcfqWYlDLKeqiuJkCbymKeUvgq
      mO7ltxXuXYM/SrFA7uKqOOVpyxBn5q7x4R/wPevKMQy67Awai/XXhnNAC4GohlRH
      ks6SW4vwCfQXUddF4GnR6oNNBldcE+bpgFAC7UPr6PfDZSBQBuCKQ5XZmKrr+a4I
      MUxViaeOaj6tOpItIY/1iUGO8kWzs1sP7cwtxIGCEixW620eJZmYkPt548xj3xOm
      wiQsrC/DguOQ2xgS3YH/Vj/1LeaXgFUH7//awLSoxDzCopZ6RHifh7HuI0yyzUYw
      VsQLusZUK73tCiHtb3A64x6Yj/afXw8n/LfMxQGhN96NSN4eJ5XkjHlr28lgtw3l
      2DF0O3RJmAyEnJ0QuBCD/WmljzU5HFx5zBg7eqswRHI2bZtAlWSU8Zp4PrJUEw4x
      TsuWKQKIo/4Gjf9N2NxH7UjqJw1UUAZ9KirJopAwyzY61FZCc2WdcytkkoC9cLqQ
      gjR9Iz2SSGhOrjEOIqbq5bXb51BBBnuLUEtBBq788HID8hK3P1d5D8IFwh2dsw5o
      1bL9P29K4aIkppx9/dZD4ucW/HASs47sTn2uVvTvlcIeZZM7I3bI5V44/xaDcINR
      WKUPgt0B9lQ5fxjFAS0NAnOrgsc+thPXMFYV3gpc0XMCuJCmZPL/++ECAwEAAQ==
      -----END RSA PUBLIC KEY-----
      '';

    dedominic_pw = ''
      Address = dedominic.pw
      Port = 655
      Subnet = fd69:1234:5678::0/128

      -----BEGIN RSA PUBLIC KEY-----
      MIICCgKCAgEAtQL1gtk2BYGqHqIa8RlOY1E8IVrP7+klrPE6oBlXj2z20SS/4Wqj
      rR1ZjzZjGHDrVe/rvlSRBJmkZ7/gt9s4Nr8II858Soap+pOH6uw3YgMUCQp1vRv2
      O5K0y6mtXQZFVI3Qp2jNbyaNv1P/WU3rQ1JdOWnQ92o0ARXzdWXS10N5Va+nVlTM
      OjKXZ9sj5k+7zBhgaHhBW2JyZgKsqz6LhvZueJWYmNdzhk1aCaGbXgE33HaaxyQY
      ZnB/+PHYBOkSnx6RQpHKYwKUt94TR6tx8wLFuNh/Oz9cXQHDGOwZ8+q7RCUBQLhG
      x9ZRShfzUZy8KRaj8AHrOS0SinGIAA4bxNuwV4PC+UhwCFiBotxPpsrMVHsK/g9i
      /FZegan6qestNh8wIrkRVfdwadO4RjXsGverksLk9ACEuhIpH63qrTC4J3ubkt3a
      AULEE1cNg5NECbiplxP7O9Mqx9Im+gEPeE1Rbk6a5UrHyP9lfOBcfg3H2vAG3Gzf
      u7JFHUJLKklcZOvmqJeZwN5u0IMVkrLceXxqfaqoio304zqwiGgxEmIN57Rgd3ia
      +nmtKfcW2GEUaMn1sv4XkCOyYS97vliwR00nnGS63g5SkHUSBRQt8wgL5SMfz6vy
      JgJ64CSVkzIezH8ZgU/JLAhh0FhzksrsSu4FOfxTo9gL/oz4kBJFW/kCAwEAAQ==
      -----END RSA PUBLIC KEY-----
      '';

    home_dedominic_pw = ''
      Address = home.dedominic.pw
      Port = 655
      Subnet = fd69:1234:5678::1/128

      -----BEGIN RSA PUBLIC KEY-----
      MIICCgKCAgEAtnJYlqU6RqsgSr2H9m8LAsN5zSYiFcrlNlAQt+Iobksa6xD4NRxY
      1aBAKSlM4xk5Hh1jpGCTeosju+BPdBaUoj7XToR3EkxtbYv7p8/VcrRTKLrc801A
      D1fWvcF9VYqnQHQJPwGP19LhmhJq3Z4KsNNwjm18i3JjFQq2c8dgtjFruWuBR/Ff
      QFiNSKiADIzbGVgIgmt9TJum0POiuyTFKK4af5p3tavQNqNIjMh7DJdfr4FYlsFo
      fY0gpdix+06knteM6OJHb2KXG05WkMwGxzFY0c3JKAYShC8Jt+C3hiD/2NY/UHjw
      RVjcZFMsxyTsM501KZ8mFfPY7VQRbMq6bwFVEPASnZx2oXnJozM4iysK5LFvO4rK
      ZrTASyqB7KFjhRadrf5r+flL0JQexe6sL5GlGqeooWm5moRpxVkOjc+62Akm6lCl
      xZruoKoO9sNuerjtLfXeA8sDyB6tyjtID0maZ5X91HCv+8Tk86RAEd5Zr43XDbHc
      XjRUuW2vHX8r9cxmzmA2ImvlsQYns7NuUp0JRyrk0gcnbXErOC3J7aP8BzH3v/mr
      aisJFME9g5i+GR2PdZuXaCkdyoxuguldNNgdJLNk/ewn5hg7eT6tK08x9HXJ/d9U
      GGgfX4UwEjNazLNC0o/WedP93zttoYpEpbl6urwI5G/elvM5sluY2lECAwEAAQ==
        -----END RSA PUBLIC KEY-----
      '';

    smooth_operator = ''
      Port = 655
      Subnet = fd69:1234:5678::2/128

      -----BEGIN RSA PUBLIC KEY-----
      MIICCgKCAgEAw2ZYWcYz6UYXzjLqoAY4QtBCd/PoUFnwn7e81bVEsODT2kBlRgDh
      Nb4S6OfUgfCBHUTGkDxJE9mwC17PT7e6xl+vMvHoqfdEdkXaexTYjYZ8Lv0rwYpU
      9cKw9wZ7y5/vPHC7PRs0oWeGLNsxvnQC46hNwzjQrL0o0J14ivVl2qi8DSfR0Yg2
      5mgwm0sj4HZh8xEjCqg6lCkGsVfpdeSwCs33Mtj0jJId08MLkBqCItldAAg5CBRh
      0iRdO43Dbu0AZSisS2UGo5BrMR7Res5qewC5GLrA4Yy3UDeYmbAukC1KT2dnhtc7
      e7NIsT2LbKnZ2ZxYDiKmmcvAWlwyo7Kg3oG8wvcnbYJyxvcUFevBehgBQsiz17gS
      7Obg3aLw7Y7rFB0VvbHmYK35IYotfGnXWPUTvBALC+z0qd1MtKs9Al7henbV2PtS
      cc4w3qbu0LWArts/SYgOauHZ6QPW1iTIaDkdeIHbRXdItgOaoKsDTXekU1o3CInc
      5PeOZWS+vZnSnVRBYtreVwt/HhI4T4QyUPnS0A9M+aFZpGdHZAF/799r0AwShPfW
      yqqmTo9JN7Gzdd9drQPqgGDYsjinAdloSFeZxRjtq7xxqEChriAspksY77Wy4ePC
      21ajerJUl1/0FjkQ2eqoeK95p5IuPb2p1Rlq+LSFfwH5f8MDsGBOoAsCAwEAAQ==
      -----END RSA PUBLIC KEY-----
      '';
    
    adedominic_Precision_5530 = ''
      port = 655
      Subnet = fd69:1234:5678::3/128
      
      -----BEGIN RSA PUBLIC KEY-----
      MIICCgKCAgEApwI2g2L7fPdQN5HqmFHpmxk/I3pK9Xctl9ZIVIJh0+Yx1xwKNR2w
      UTDbCV8X/l1erkDEHFKHFCHfU1MIrXs8jtu4zBrY0w5bW9Y2LB1QB15QQxLbhsWH
      OqrWOQtlaQ7NR/ZStc3SwRXpthKi1Jjjv8h04uDpQE1itFUlG+LvV/n/QMIBvSEJ
      uuw6CqQ5PoPQ14rYEB40l3lYS8Q3WUA9Xw3LWn2vJCyHh8sfvdnAja39IIObJYzO
      EN52cTYUHG4nIRAQzgv8ESbyg7f7YSD0KjqPsXeajk/oExXyzATnbpT1FFd3jzyd
      kKF/jAWwhJtEdJZfLshj0FtaBn7rT4RiEpEgH6/jf4lozR8yc5Z+FXibTgWP8lIb
      J+xADrlPQufxqtZ8RCwQbYGHtiQjU1CwxaaM/xLh64gFZbm2HvGj/bpAxt4zdoTq
      cFvkZDCjhbvtxpXp9iefK3h4VuDH6440qVo717YHI3/3PzV6kMWWkjYUjwdlNNDN
      26+B2CJEW14cUOFLCrObkJq0NlbY0+wN74fLnQ9Ba/96Ia6IV2d0EjxlR+DKMQ9H
      tEplRAflyA0DCbANbwL9/ilAYweFMMGQKlfpTn9XoGhZTO4Ep9SW5dYaoAzvP4wC
      TNRxL6FIdmTSGcrAF+xevSChJnPdNFhuAu2iUjHr7BvhFUalJnWUGwsCAwEAAQ==
      -----END RSA PUBLIC KEY-----
      '';
  };
in
  {
    options.tinc = {
      enable = mkEnableOption "Use Tinc Network";
    };

    config = mkIf cfg.enable {
      assertions = [
        {
          assertion = hosts ? "${peerName}";
          message = "The hostname ${peerName} is not in the host list. Please add it to ./common/tinc.nix";
        }
      ];

      environment.etc = {
        "tinc/${netName}/tinc-up".source = pkgs.writeScript "tinc-up-${netName}" ''
        #!${pkgs.stdenv.shell}
        /run/wrappers/bin/sudo ${pkgs.iproute2}/bin/ip -6 link set "$INTERFACE" up
        /run/wrappers/bin/sudo ${pkgs.iproute2}/bin/ip -6 addr add ${extractIpAddr peerName} dev "$INTERFACE"
        /run/wrappers/bin/sudo ${pkgs.iproute2}/bin/ip -6 route add ${netSubnet} dev "$INTERFACE"
        '';

        "tinc/${netName}/tinc-down".source = pkgs.writeScript "tinc-down-${netName}" ''
        #!${pkgs.stdenv.shell}
        /run/wrappers/bin/sudo ${pkgs.iproute2}/bin/ip -6 addr del ${extractIpAddr peerName} dev "$INTERFACE"
        /run/wrappers/bin/sudo ${pkgs.iproute2}/bin/ip -6 link set "$INTERFACE" down
        '';
      };

      security.sudo.extraRules = [
        {
          users    = [ "tinc.dedominic" ];
          commands = [
            {
              command  = "${pkgs.iproute2}/bin/ip";
              options  = [ "NOPASSWD" ];
            }
          ];
        }
      ];

      networking.networkmanager.unmanaged = mkIf config.networking.networkmanager.enable [
        "tinc.${netName}"
      ];


      services.tinc.networks."${netName}" = {
        # use old tinc for now.
        package = pkgs.tinc;
        name = peerName;
        interfaceType = "tun";
        inherit hosts;
        extraConfig = ''
        ConnectTo = dedominic_pw
        PrivateKeyFile = /root/secrets/tinc/${netName}/rsa_key.priv
        '';
      };

      # I need networking to query/connect
      systemd.services."tinc.${netName}".after = [ "NetworkManager-wait-online.service" ];
    };
  }
