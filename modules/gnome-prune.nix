{ config, pkgs, ... }:

{
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-calculator
    epiphany
    geary
    gnome-contacts
    gnome-weather
    gnome-maps
    gnome-music
    totem
    evince
  ];
}
