{ config, pkgs, ... }:
  
{
   
  home.username = "nixos_u0";
  home.homeDirectory = "/home/nixos_u0";
  home.stateVersion = "25.05";
  imports = [

#    ../modules/starship.nix
    ../modules/bash.nix
    ../modules/bash.nix
    ../modules/git.nix
    ../modules/vim.nix
      
  ];
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    powerline-fonts
    firefox
    ghostty
    texlive.combined.scheme-full
    tectonic
    zathura
    obsidian
    texstudio
    libreoffice

   ];
     
 

 }
