{ config, pkgs, lib, ... }:

{
  # Enable PLASMA 6 desktop

    services.xserver.enable = true;
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm = {
     enable = true;
     theme = "catppuccin-mocha";
     };

    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
    # Needed for unlocking KWallet automatically on login
    security.pam.services.sddm.enableKwallet = true;

  
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  oxygen
];
  
  # Optional: Additional GNOME packages
  environment.systemPackages = with pkgs; [
  kdePackages.partitionmanager
  kdePackages.isoimagewriter
  kdePackages.kwallet-pam
  kdePackages.kwalletmanager

  ];

  # Optionally set default session (if needed)
  # services.xserver.displayManager.defaultSession = "plasma";
}
