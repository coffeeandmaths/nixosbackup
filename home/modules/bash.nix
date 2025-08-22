{ pkgs, config, ... }:

{
programs.bash = {
  enable = true;
  shellAliases = {
     updateg = "cd $HOME/.dotfiles && sudo nixos-rebuild switch --flake .";
     updateh = " cd $HOME/.dotfiles && home-manager switch --flake .";
     cleanh = "nix-collect-garbage -d";
     cleang = "sudo nix-collect-garbage -d";
     ld = "cd $HOME/.dotfiles";
   };
  };
  
} 
