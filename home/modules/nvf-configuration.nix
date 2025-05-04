{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      set number
      syntax on
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-sensible
    ];
  };
}

