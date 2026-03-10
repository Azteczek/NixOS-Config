{ config, pkgs, ... }:
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

# !! WAYBAR !! 
	xdg.configFile."waybar/config.jsonc".source = ./config/waybar/config.jsonc;
	xdg.configFile."waybar/style.css".source = ./config/waybar/style.css;
# !! SWAYLOCK
#	programs.swaylock.enable = true; 
#	xdg.configFile."swaylock/config".source = ./config/swaylock/config;  
# !! FOOT !!
	xdg.configFile."foot/foot.ini".source = ./config/foot/foot.ini;
# !! HYPRPAPER !!
	xdg.configFile."hypr/hyprpaper.conf".source = ./config/hypr/hyprpaper.conf;


}
