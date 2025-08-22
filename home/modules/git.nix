{config,pkgs, ...}:
{
  #-----------------GIT--------------------------
  programs.git = {
    enable = true;
    userName = "cofeeandmaths";
    userEmail = "nixos_u0@nixos.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "$HOME/nixos_u0/.dotfiles";
    };
  };
}
