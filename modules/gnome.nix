{ config, pkgs, lib, ... }:

{
  # Enable GNOME desktop
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
<<<<<<< HEAD
  };

=======
    displayManager.gdm.wayland = true;
  };
  
>>>>>>> 0a93179 (Original)
  # Optional: Enable GNOME keyring
  services.gnome.gnome-keyring.enable = true;

  

  # Optional: Additional GNOME packages
  environment.systemPackages = with pkgs; [
<<<<<<< HEAD
    gnome-tweaks
    dconf-editor
    # gnomeExtensions.your-favorite-extension
  ];

  # Optional: Dconf tweaks (if you want to set dark mode, keybindings, etc.)
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #     enable-animations = false;
  #   };
  # };

  # Optionally set default session (if needed)
  # services.xserver.displayManager.defaultSession = "gnome";
=======
    gnome-control-center
    gnome-session
    gnome-tweaks
    gnome-themes-extra
  ];
  
>>>>>>> 0a93179 (Original)
}
