{ ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Roboto Mono:size=12";
      };
      scrollback = {
        lines = "4096";
      };
      cursor = {
        color = "fdf6e3 586e75";
        style = "block";
        blink = "no";
      };
      colors = {
        background = "fdf6e3";
        foreground = "586e75";
        regular0 = "073642";
        regular1 = "dc322f";
        regular2 = "859900";
        regular3 = "b58900";
        regular4 = "268bd2";
        regular5 = "d33682";
        regular6 = "2aa198";
        regular7 = "eee8d5";
        bright0 = "002b36";
        bright1 = "cb4b16";
        bright2 = "586e75";
        bright3 = "657b83";
        bright4 = "839496";
        bright5 = "6c71c4";
        bright6 = "93a1a1";
        bright7 = "fdf6e3";
      };
      csd = { size = "20"; };
      key-bindings = {
        show-urls-launch = "Control+Shift+F";
      };
    };
  };
}
