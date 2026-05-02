{ config, pkgs, ... }: {
	imports = [
		./audio.nix
		./firewall.nix  
		./gvfs.nix
		./polkit.nix
		./steam.nix
		./zerotierone.nix
		./bluetooth.nix  
		./flatpak.nix   
		./hyprland.nix
		./printing.nix
		./udisks2.nix
		./firefox.nix
		./git.nix
		./logmein-hamachi.nix
		./sddm.nix
		./vbox.nix
	];
}
