{ config, pkgs, ... }: {
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/krystian/nixos-dotfiles/modules/hyprpaper/wpaper/nixos.jpg"
      ];
      
      wallpaper = [
        "eDP-1,/home/krystian/nixos-dotfiles/modules/hyprpaper/wpaper/nixos.jpg"
        "HDMI-A-1,/home/krystian/nixos-dotfiles/modules/hyprpaper/wpaper/nixos.jpg"
      ];
    };
  };
}
