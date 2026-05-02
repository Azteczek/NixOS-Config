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
    prismcrack = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
    };
  };


  outputs = { nixpkgs, home-manager, mnta, prismcrack, ...} @ inputs: {
    nixosConfigurations.krystian = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      
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
