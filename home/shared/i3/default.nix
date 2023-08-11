{ pkgs, config, ... }: {

  imports = [
    #  ../../home/shared/theme
  ];

  # config
  home.file = {
    ".config/i3/config".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/i3/config;
    ".xinitrc".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/i3/xinitrc;
    ".wallpapers/".source = config.lib.file.mkOutOfStoreSymlink /work/andre/dotfiles/home/shared/theme/wallpapers;
  };

  # programs
  home.packages = with pkgs; [
    dmenu #application launcher most people use
    i3
    i3status # gives you the default i3 status bar
    i3lock #default i3 screen locker
    i3blocks #if you are planning on using i3blocks over i3status
    libinput

    # launcher
    wofi

    # status bar
    waybar

    # terminal
    alacritty

    # xwayland

  ];


  services.picom.enable = true;

}
