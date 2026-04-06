{
  description = "Hyprland on NixOs";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mnta = {
      url = "github:Khenziii/mnta";
    };
  };


  outputs = { nixpkgs, home-manager, mnta, ...} @ inputs: {
    nixosConfigurations.krystian = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.krystian = { config, pkgs, ... }:
	      import ./home.nix {
	        inherit config pkgs inputs;
	      };
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
