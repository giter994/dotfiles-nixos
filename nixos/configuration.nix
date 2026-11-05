{ config, pkgs, ... }: 
{
  imports = [ 
      ./hardware-configuration.nix
      ./imports/packages.nix
      ./imports/configs.nix
      ./imports/networking.nix
    ]; 

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
	
  # Bootloader.
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # User
  users.users."billy" = {
    isNormalUser = true;
    description = "billy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  i18n.defaultLocale = "en_ZA.UTF-8";
  time.timeZone = "Africa/Johannesburg";
  
  # Ignore power key press
  services.logind.settings.Login = {
  	HandlePowerKey = "ignore";
    HandlePowerKeySuspend = "ignore"; # only needed if you have a phantom hold detected as long-press
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # services.udev.extraRules = ''
   # KERNEL=="hidraw*", SUBSYSTEM=="hidraw", TAG+="uaccess"
  #'';

  fonts.fontconfig.enable = true; # usually default true, but be explicit
 
  programs.fish.shellAliases = {
    fastfetch = "fastfetch -c ~/.config/fastfetch/config.jsonc";
  };
  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  system.stateVersion = "26.05"; 
}
