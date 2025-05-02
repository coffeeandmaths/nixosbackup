{ config, pkgs, ... }:
  
{
   
  home.username = "nixos_u0";
  home.homeDirectory = "/home/nixos_u0";
  home.stateVersion = "24.11"; 
  imports = [

#    ../modules/starship.nix
    ../modules/bash.nix
    ../modules/vim.nix
    ../modules/bash.nix
    ../modules/git.nix
  ];
  home.packages = with pkgs; [
  nerdfonts
  powerline-fonts
  calibre
  firefox
  jetbrains.pycharm-community-bin
  obsidian
  ];
     
 

 }
