{ config, pkgs, lib, ... }:

{
  # Enable PLASMA 6 desktop

    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;

  
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  oxygen
];
  
  # Optional: Additional GNOME packages
  environment.systemPackages = with pkgs; [
  ];

  # Optionally set default session (if needed)
  # services.xserver.displayManager.defaultSession = "plasma";
}
