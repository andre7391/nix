{ pkgs, outputs, ... }: {

  imports = [
    ../../home/shared/theme
    ../../home/shared/hyprland
    ../../home/shared/sway
    ../../home/shared/i3
    ../../home/shared/polybar
    ../../home/shared/alacritty
    ../../home/shared/eww
    ../../home/shared/waybar
    ../../home/shared/python
  ];


  nixpkgs = {
    overlays = [
      outputs.overlays.modifications
    ];

    # nix configs
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
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


    material-design-icons
    font-awesome
    jetbrains-mono

    vlc
    pavucontrol

    pulseaudio

    swww
    jq

    lxde.lxsession

    inotify-tools

    bspwm
    sysstat
    # busybox
    lm_sensors
    nload
    # 7zip
    p7zip
  ];

  #programs.dconf.enable = true;

  fonts.fontconfig.enable = true;
}
