{ pkgs, inputs, ... }: {

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  # impermanence
  home.persistence."/work/andre" = {
    directories = [

      # google-chrome
      ".config/google-chrome"

      # vscode
      ".config/Code"
      ".vscode"

      # qbittorrent
      ".config/qBittorrent"
      ".local/share/qBittorrent"
    ];
    files = [
      # bash history
      ".bash_history"
    ];
    allowOther = false;
  };

  # mkdir -p /work/andre/.config
  # cp -r /home/andre/.vscode /work/andre/.vscode
}
