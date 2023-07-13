{ pkgs, ... }: {

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
  ];

}
