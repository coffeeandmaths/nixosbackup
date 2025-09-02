{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./modules/hardware-configuration.nix
      ./modules/plasma.nix
      ./modules/networking.nix
      ./modules/printer.nix
      ./modules/programs.nix
      ./modules/audio.nix
      ./modules/locales.nix
    ];
  system.stateVersion = "25.05";
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

  # User account
  users.users.nixos_u0 = {
    isNormalUser = true;
    description = "Ramon Armeria";
    extraGroups = [ "networkmanager" "wheel" "lp" "lpadmin"];
    packages = with pkgs; [
    ];
  };

  environment.shells = with pkgs; [ bash ];
  users.defaultUserShell = pkgs.bash;

  }
