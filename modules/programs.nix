{ config, pkgs, ... }:

{
   nixpkgs.config.allowUnfree = true;
   environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    appimage-run
    wget
    curl
    openvpn
    qbittorrent
    git
    julia
    micro
    tor-browser
    home-manager
    catppuccin-sddm
    (texlive.combine {
      inherit (texlive)
        # Base + LaTeX
        scheme-medium
        collection-latexrecommended
        collection-latexextra

        # Maths + science
        collection-mathscience     # amsmath, mathtools, amsthm, siu>
        collection-bibtexextra     # biblatex/biber styles, etc.
        collection-fontsrecommended

        # Tools I actually want available:
        latexmk
        pgfplots
        tikz-cd
        standalone
        xcolor
        etoolbox
        cleveref
        csquotes
        l3packages l3kernel;  # LaTeX3 core (many packages depend on>
    })
    ];

    fonts.packages = with pkgs; [
    dejavu_fonts    # clean sans/serif
    liberation_ttf  # LibreOffice-friendly serif/sans/mono
    jetbrains-mono # optional, if you want for math/code in docs
    gyre-fonts
    ];



}
