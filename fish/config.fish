if status is-interactive
fastfetch

set fish_greeting ""


abbr --add renix sudo nixos-rebuild switch 
abbr --add reflake sudo nixos-rebuild switch --flake /etc/nixos/nixos

abbr --add nconfig sudo micro /etc/nixos/configuration.nix 
abbr --add net  sudo micro /etc/nixos/imports/networking.nix
abbr --add pkgs sudo micro /etc/nixos/imports/packages.nix
abbr --add configs sudo micro /etc/nixos/imports/configs.nix
abbr --add flakes sudo micro /etc/nixos/flake.nix 

abbr --add fishconfig micro ~/.config/fish/config.fish
abbr --add hconfig micro ~/.config/hypr/hyprland.lua 

end
