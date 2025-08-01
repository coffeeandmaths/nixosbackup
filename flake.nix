{
  description = "General configuration of raonixos_u0";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, self, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in {
    #-----------------NIXOS-------------------
    nixosConfigurations = {
      "nixos" = lib.nixosSystem {
       inherit system;
       modules = [
            ./configuration.nix
            #-----HOME MANAGER MODULES----------------
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.nixos_u0 = import ./home/users/nixos_u0.nix;
              # This enables automatic backup of conflicting files
              home-manager.backupFileExtension = "backup";
             }
             ];
           };
          };
        };
      }

#-------------HOME MANAGER STANDALONE-------------------------       

      #  homeConfigurations = { 
      #      "nixos_u0" = home-manager.lib.homeManagerConfiguration {
      #           inherit pkgs;
      #           modules = [ ./home.nix];
      #        };
      #      };
