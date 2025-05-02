{congig,pkgs, ...}:
{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix    # Syntax highlighting for .nix
      vim-airline
    ];

    settings = {
      # Vim settings
      number = true;
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      ignorecase = true;
    };

    extraConfig = ''
      " Syntax highlighting
      syntax on
      filetype plugin indent on

      " Use gcc with :make (compile C files)
      set makeprg=gcc\ -Wall\ -o\ %<\ %

      " Use quickfix for errors
      set errorformat=%f:%l:%c:\ %m
    '';
  };
}