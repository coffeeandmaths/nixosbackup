{ config, pkgs, ... }:
  
{
   
  home.username = "nixos_u0";
  home.homeDirectory = "/home/nixos_u0";
  home.stateVersion = "24.11"; 
  imports = [
<<<<<<< HEAD
#    ../modules/starship.nix
    ../modules/bash.nix
    ../modules/vim.nix
=======
    ../modules/bash.nix
>>>>>>> 0a93179 (Original)
    ../modules/git.nix
  ];
  home.packages = with pkgs; [
  nerdfonts
  powerline-fonts
  calibre
  firefox
<<<<<<< HEAD
=======
  jetbrains.pycharm-community-bin
  obsidian
>>>>>>> 0a93179 (Original)
  ];
     
 

 }
