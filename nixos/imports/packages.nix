{ config, pkgs, inputs, ...}:
{
  environment.sessionVariables = {
    MESA_LOADER_DRIVER_OVERRIDE = "iris";
  };

   environment.systemPackages = with pkgs; [   
    #WM/DE
    niri
    dwl

    # Applications
    yazi
    blender
    proton-vpn
    librewolf
    libreoffice
    discord
    nemo
    kitty
    steam
    kdePackages.ark
    kdePackages.kdeconnect-kde
    
    # Picture-Related
    vlc 
    imv 
    obs-studio
    gpu-screen-recorder-gtk
    grim
    satty
    	
    # Wine
	  winetricks
	  wineWow64Packages.base
	  wine64
	
    # Wayland Drivers
    xwayland-satellite
    xwayland
    wlroots_0_20
    wayland
    wayland-protocols
    xwayland

    
    #Wayland Tools
    nwg-look
    xdg-desktop-portal-gtk
    mako
    swaybg
    hyprpolkitagent
    pavucontrol
    wlogout
    rofi
    waybar
    
    # IDE's
    neovim
  	vscodium
    micro

    # GPU Drivers 
    mesa
    intel-media-driver
    vpl-gpu-rt
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers

    # Terminal Tools
    libnotify
    cabextract
    btop
    cava
    file
    wget
    cabextract
    git
    p7zip
    fastfetch
    fish

    #GTK THEMES
    kdePackages.breeze-gtk 
    catppuccin-gtk
    papirus-icon-theme

    # Gaming Tools
    protonplus
    mangohud
    gamemode
    gamescope
  ];

  fonts.packages = with pkgs; [
    times-newer-roman
    inter
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];

  services.flatpak.enable = true;
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://flathub.org";
    }
  ];

  services.flatpak.packages = [
  "org.vinegarhq.Sober"
  "org.vinegarhq.Vinegar"
  ];

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;	
  services.pipewire = {
    enable = true;
    	alsa.enable = true;
    	alsa.support32Bit = true;
    	pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  services.blueman.enable = true; 
  programs.firefox.enable = true;  
  programs.hyprland.enable = true; 
  hardware.uinput.enable = true; 
  hardware.steam-hardware.enable = true;
  

  services.upower.enable = true;  
  services.thermald.enable = true;  
  services.power-profiles-daemon.enable = true; 
 
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

    hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required for Steam and 32-bit games
  };

}