{congig,pkgs, ...}:
{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix    # Syntax highlighting for .nix
      vimtex
      gruvbox
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
      
      " Theme
       colorscheme gruvbox
        set background=dark
 
      " VimTeX configuration
      
      " Disable auto-opening of quickfix window after LaTeX compilation
       let g:vimtex_quickfix_mode = 0
      let g:vimtex_view_method = 'zathura'
      let g:vimtex_compiler_method = 'tectonic'
    '';
  };
}
