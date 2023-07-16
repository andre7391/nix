{ config, pkgs, ... }: {



  # hyprland
  home.file = {
    ".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/programs/hyprland/hyprland.conf;
  };
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty";
      startup = [
        # Launch Firefox on start
        { command = "firefox"; }
      ];
    };
  };



  # status bar

  # launcher
  home.packages = with pkgs;  [
    wofi
    waybar
  ];

}
