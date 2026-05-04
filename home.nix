{ config, pkgs, inputs, ... }:
{
	home.username = "krystian";
	home.homeDirectory = "/home/krystian";
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use Hyprland btw";
			rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#krystian";
		};
		profileExtra = ''
			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
				exec hyprland
					fi
					'';
	};

	imports = [
		./modules/nvim.nix
		./modules/mnta.nix
		./modules/waybar.nix
		./home-manager/hyprpaper.nix
	];
        _module.args = { inherit inputs; };	
	
}
