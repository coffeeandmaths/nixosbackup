{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./modules/hardware-configuration.nix
      ./modules/plasma.nix
      ./modules/networking.nix
      ./modules/printer.nix
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
 
     
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  swapDevices = [{ device = "/swapfile"; size = 8192; } ];
  nix.settings = {
    max-jobs = 1;
    cores = 0;
  };



  
  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

   # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User account
  users.users.nixos_u0 = {
    isNormalUser = true;
    description = "Ramon Armeria";
    extraGroups = [ "networkmanager" "wheel" "lp" "lpadmin"];
    packages = with pkgs; [
       
    ];
  };

   environment.systemPackages = with pkgs; [
    wget
    git
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

    # Needed for unlocking KWallet automatically on login
     security.pam.services.sddm.enableKwallet = true;

    fonts.packages = with pkgs; [
    dejavu_fonts    # clean sans/serif
    liberation_ttf  # LibreOffice-friendly serif/sans/mono
    jetbrains-mono # optional, if you want for math/code in docs
    gyre-fonts
  ];


    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.05"; # Did you read the comment?
  
    environment.shells = with pkgs; [ bash ];
  
    users.defaultUserShell = pkgs.bash;

  }
