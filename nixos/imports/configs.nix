{ config, pkgs, input, ...}:
{
  environment.etc."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com",
      "logo": {
        "source": "nixos",
        "padding": {
          "right": 2
        }
      },
      "modules": [
        "title",
        "separator",
        "os",
        "kernel",
        "uptime",
        "packages",
        "shell",
        "display",
        "de",
        "wm",
        "cursor",
        "terminal",
        "terminalfont",
        "memory",
        "disk",
        "break",
        "colors"
      ]
    }'';
}