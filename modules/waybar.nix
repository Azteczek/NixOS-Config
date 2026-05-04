{ config, pkgs, ... }: {

	programs.waybar = {
		enable = true;
    		settings = {
      			mainBar = {
        			layer = "bottom";
        			position = "top";
        			height = 40;
        			spacing = 2;
        			exclusive = true;
        			gtk-layer-shell = true;
        			passthrough = false;
        			fixed-center = true;
        
        			modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        			modules-center = [ "mpris" ];
        			modules-right = [
        			  "cpu"
        			  "memory"
        			  "pulseaudio"
        			  "clock"
        			  "clock#simpleclock"
        			  "tray"
        			  "custom/notification"
        			  "custom/power"
        			];

        			"custom/spotify" = {
        		  		format = "  {}";
        		  		return-type = "json";
        		  		on-click = "playerctl -p spotify play-pause";
        				on-click-middle = "playerctl -p spotify next";
        				exec = "playerctl -p spotify metadata --format '{{artist}} - {{title}}'";
        			};

        			mpris = {
        				player = "spotify";
        				dynamic-order = [ "artist" "title" ];
        				format = "{player_icon} {dynamic}";
        				format-paused = "{status_icon} <i>{dynamic}</i>";
        				status-icons = { paused = ""; };
        				player-icons = { default = ""; };
        			};

        			"hyprland/workspaces" = {
        				on-click = "activate";
          				format = "{id}";
          				all-outputs = true;
          				disable-scroll = false;
          				active-only = false;
        			};

        			"hyprland/window" = { format = "{title}"; };

        			tray = {
        				show-passive-items = true;
        				spacing = 10;
        			};

        			"clock#simpleclock" = {
        				tooltip = false;
        				format = " {:%H:%M}";
        			};

        			clock = {
          				format = " {:L%a %d %b}";
          			calendar = {
        				format = {
              					days = "<span weight='normal'>{}</span>";
              					months = "<span color='#cdd6f4'><b>{}</b></span>";
              					today = "<span color='#f38ba8' weight='700'><u>{}</u></span>";
              					weekdays = "<span color='#f9e2af'><b>{}</b></span>";
              					weeks = "<span color='#a6e3a1'><b>W{}</b></span>";
        				};
            				mode = "month";
            				mode-mon-col = 1;
            				on-scroll = 1;
          				};
          			tooltip-format = "<span color='#cdd6f4' font='Lexend 16'><tt><small>{calendar}</small></tt></span>";
        			};

        			cpu = {
          				format = "CPU {usage}%";
          				tooltip = true;
          				interval = 1;
        			};

        			memory = { format = "RAM {used:0.1f}Gi"; };

        			pulseaudio = {
          				format = "{icon} {volume}%";
          				format-muted = "  muted";
          				format-icons = {
          					headphone = "";
            					default = [ " " " " " " ];
          				};
          				on-click = "pavucontrol";
        			};

        			"custom/sep" = { format = "|"; tooltip = false; };

        			"custom/power" = {
        				tooltip = false;
          				on-click = "wlogout -p layer-shell &";
          				format = "⏻";
        			};

        			"custom/notification" = {
          				escape = true;
          				exec = "swaync-client -swb";
          				exec-if = "which swaync-client";
          				format = "{icon}";
          				format-icons = {
          					none = "󰅺";
            					notification = "󰡟";
          				};
          				on-click = "sleep 0.1 && swaync-client -t -sw";
          				return-type = "json";
          				tooltip = false;
       	 			};
      			};
    		};

	style = ''
      		* {
        		min-height: 0;
        		min-width: 0;
        		font-family: Lexend, "JetBrainsMono NFP";
        		font-size: 16px;
        		font-weight: 600;
        		color: #ffffff;
      		}
      		window#waybar {
        		transition-property: background-color;
        		transition-duration: 0.5s;
        		background-color: #11111b;
      		}
      		#workspaces button {
        		padding: 0.3rem 0.6rem;
        		margin: 0.4rem 0.25rem;
        		border-radius: 6px;
        		background-color: #1e1e2e;
        		color: #ffffff;
      		}
      		#workspaces button:hover {
        		color: #1e1e2e;
        		background-color: #ffffff;
      		}
      		#workspaces button.active {
        		background-color: #1e1e2e;
        		color: #89b4fa;
      		}
      		#clock, #pulseaudio, #custom-logo, #custom-power, #cpu, #tray, #memory, #window, #mpris {
        		padding: 0.3rem 0.6rem;
        		margin: 0.4rem 0.25rem;
        		border-radius: 6px;
        		background-color: #1e1e2e;
      		}
      		#custom-power { color: #f38ba8; }
      		tooltip {
        		background-color: #181825;
        		border: 2px solid #89b4fa;
      			}
      		tooltip label { color: #ffffff; }
    	'';
};
}
