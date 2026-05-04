{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "KrystianAtNixOS";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  boot.loader.systemd-boot.configurationLimit = 5;
  
  # Unfree allowed
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.krystian = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    hplipWithPlugin
    spotify
    kitty
    waybar
    discord
    librewolf
    libreoffice
    lshw
    rofi
    gimp
    kdePackages.dolphin
    kdePackages.qtsvg
    fastfetch
    hyprshot
    hyprcursor 
    sddm-sugar-dark  
    overskride
    geeqie
    usbutils
    p7zip-rar
    unzip
    openttd
    haguichi
    zerotierone
    lunar-client
    vscode
    libgcc
    gcc
    python3
    pavucontrol              
    playerctl                
    wlogout                  
    swaynotificationcenter   
    lexend                   
    nerd-fonts.jetbrains-mono
 #   vinegar
];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment?

}

