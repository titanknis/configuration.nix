{ pkgs, ... }:

{
  home.file.".config/kitty/kitty.conf".text = ''
font_family Fira Code
background_opacity 0.9 
  '';
}


