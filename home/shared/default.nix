{ pkgs, ... }: {

  imports = [
    ../../home/shared/theme
    #../../home/shared/hyprland
    ../../home/shared/sway
    ../../home/shared/alacritty
    ../../home/shared/eww
    ../../home/shared/waybar
  ];

  # nix configs
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # programs
  home.packages = with pkgs;  [
    git
    neofetch
    google-chrome
    vscode
    vim
    kitty
    nixpkgs-fmt
    qbittorrent
    xfce.thunar
    glib
    udiskie
    google-chrome
    htop
    btop
    transmission-gtk
    killall


    material-design-icons

    vlc
    eww-wayland
    pavucontrol

    pulseaudio

    swww
    jq

    polkit_gnome


  ];

  fonts.fontconfig.enable = true;
}
