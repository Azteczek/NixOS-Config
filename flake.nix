{
  description = "Hyprland on NixOs";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-nix = {
      url = "github:Markus328/caelestia-nix";
    };
  };

  outputs = { nixpkgs, home-manager, ...} @ inputs: {
    nixosConfigurations.krystian = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.krystian = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
#        inputs: {
#          homeManagerModules.default = import ./caelestia.nix inputs;
#        };
    };
  };
}
