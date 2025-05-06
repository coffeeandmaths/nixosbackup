{ config, pkgs, ... }:
  
{
   
  home.username = "nixos_u0";
  home.homeDirectory = "/home/nixos_u0";
  home.stateVersion = "24.11"; 
  imports = [

#    ../modules/starship.nix
    ../modules/bash.nix
    ../modules/bash.nix
    ../modules/git.nix
    ../modules/vim.nix
      
  ];
  home.packages = with pkgs; [
    nerdfonts
    powerline-fonts
    firefox
    ghostty
    texlive.combined.scheme-full
    tectonic
    kile
    zathura
    obsidian
    libreoffice
   ];
     
 

 }
