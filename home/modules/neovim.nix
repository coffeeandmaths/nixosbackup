{ pkgs, ... }:

let
  lazy-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "lazy-nvim";
    version = "11.17.1";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "lazy.nvim";
      rev = "v11.17.1";  # Use fixed commit
      sha256 = sha256 = "0000000000000000000000000000000000000000000000000000";
    };
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      lua-language-server
      gcc
      ripgrep
      fd
      unzip
      stylua
    ];
    plugins = [ lazy-nvim ];
  };

  home.file.".config/nvim/init.lua".text = ''
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"
    require("your_config.lazyvim")
  '';

  home.file.".config/nvim/lua/your_config/lazyvim.lua".text = ''
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    vim.opt.runtimepath:append(lazypath)

    require("lazy").setup("your_config.plugins", {
      defaults = { lazy = true },
    })
  '';

  home.file.".config/nvim/lua/your_config/plugins.lua".text = ''
    return {
      { "folke/tokyonight.nvim" },
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
      { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    }
  '';
}
