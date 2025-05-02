{ config, pkgs, lib, ... }:

{
  # Enable GNOME desktop
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

  };

  # Optional: Enable GNOME keyring
  services.gnome.gnome-keyring.enable = true;

  

  # Optional: Additional GNOME packages
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    dconf-editor
    ];

  
}
