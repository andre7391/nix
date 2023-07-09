{ inputs, pkgs, ... }: {

  # gtk theme
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
    };
    cursorTheme = {
      name = "Dracula-cursors";
    };
  };

  # cursor theme
  home.file.".icons/default/index.theme".text = ''
    [icon theme] 
    Inherits=Dracula-cursors
  '';
}
